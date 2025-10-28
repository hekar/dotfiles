#!/bin/bash

# SwayWM Performance Optimization Script
# Run with: ./performance.sh

echo "Applying SwayWM performance optimizations..."

# Set CPU governor to performance
echo "Setting CPU governor to performance..."
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Set CPU frequency scaling to performance
echo "Setting CPU frequency scaling to performance..."
echo 1 | sudo tee /sys/devices/system/cpu/cpufreq/boost

# Disable CPU idle states for maximum performance
echo "Disabling CPU idle states..."
echo 1 | sudo tee /sys/devices/system/cpu/cpu*/cpuidle/state*/disable

# Set performance mode for all CPU cores
echo "Setting performance mode for all CPU cores..."
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    echo performance | sudo tee "$cpu" > /dev/null
done

# Set CPU frequency to maximum
echo "Setting CPU frequency to maximum..."
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed; do
    if [ -f "$cpu" ]; then
        max_freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
        echo "$max_freq" | sudo tee "$cpu" > /dev/null
    fi
done

# Increase swappiness for better responsiveness
echo "Optimizing memory management..."
echo 10 | sudo tee /proc/sys/vm/swappiness

# Optimize I/O scheduler
echo "Setting I/O scheduler to mq-deadline..."
echo mq-deadline | sudo tee /sys/block/*/queue/scheduler

# Enable writeback caching
echo "Enabling writeback caching..."
echo writeback | sudo tee /sys/block/*/queue/write_cache

# Optimize network buffers
echo "Optimizing network buffers..."
echo 'net.core.rmem_max = 134217728' | sudo tee -a /etc/sysctl.conf
echo 'net.core.wmem_max = 134217728' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_rmem = 4096 87380 134217728' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_wmem = 4096 65536 134217728' | sudo tee -a /etc/sysctl.conf

# Apply sysctl changes
sudo sysctl -p

# Set real-time priority for audio
echo "Setting real-time priority for audio..."
echo '@audio   -  rtprio     95' | sudo tee -a /etc/security/limits.conf
echo '@audio   -  memlock    unlimited' | sudo tee -a /etc/security/limits.conf

# Optimize filesystem
echo "Optimizing filesystem..."
echo 'vm.dirty_ratio = 15' | sudo tee -a /etc/sysctl.conf
echo 'vm.dirty_background_ratio = 5' | sudo tee -a /etc/sysctl.conf

# GPU optimizations
echo "Applying GPU optimizations..."
# Set GPU to performance mode (for AMD)
if [ -f /sys/class/drm/card*/device/power_dpm_force_performance_level ]; then
    echo high | sudo tee /sys/class/drm/card*/device/power_dpm_force_performance_level
fi

# Set GPU power limit to maximum (for NVIDIA)
if command -v nvidia-smi &> /dev/null; then
    sudo nvidia-smi -pm 1  # Enable persistence mode
    sudo nvidia-smi -pl 100  # Set power limit to 100%
fi

# Disable CPU power saving features
echo "Disabling CPU power saving features..."
echo 0 | sudo tee /sys/devices/system/cpu/cpufreq/boost
echo 1 | sudo tee /sys/devices/system/cpu/cpufreq/boost

# Disable CPU C-states for maximum performance
echo "Disabling CPU C-states..."
for cpu in /sys/devices/system/cpu/cpu*/cpuidle/state*/disable; do
    if [ -f "$cpu" ]; then
        echo 1 | sudo tee "$cpu" > /dev/null
    fi
done

# Set real-time kernel parameters
echo "Setting real-time kernel parameters..."
echo 'kernel.sched_rt_runtime_us = -1' | sudo tee -a /etc/sysctl.conf
echo 'kernel.sched_rt_period_us = 1000000' | sudo tee -a /etc/sysctl.conf

# Optimize for low latency
echo "Optimizing for low latency..."
echo 'kernel.sched_latency_ns = 1000000' | sudo tee -a /etc/sysctl.conf
echo 'kernel.sched_min_granularity_ns = 100000' | sudo tee -a /etc/sysctl.conf
echo 'kernel.sched_wakeup_granularity_ns = 500000' | sudo tee -a /etc/sysctl.conf

# Disable unnecessary services
echo "Disabling unnecessary services..."
sudo systemctl disable bluetooth.service
sudo systemctl disable ModemManager.service
sudo systemctl disable power-profiles-daemon.service

# Enable necessary services
echo "Enabling necessary services..."
sudo systemctl enable NetworkManager.service
sudo systemctl enable pipewire.service
sudo systemctl enable pipewire-pulse.service
sudo systemctl enable wireplumber.service

# Set systemd power management to performance
echo "Setting systemd power management to performance..."
sudo systemctl mask systemd-logind.service
sudo systemctl mask systemd-poweroff.service
sudo systemctl mask systemd-reboot.service

# Create performance service
echo "Creating performance service..."
sudo tee /etc/systemd/system/performance.service > /dev/null << 'EOF'
[Unit]
Description=Performance Mode
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'echo performance > /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
ExecStart=/bin/bash -c 'echo 1 > /sys/devices/system/cpu/cpufreq/boost'
ExecStart=/bin/bash -c 'echo 10 > /proc/sys/vm/swappiness'
ExecStart=/bin/bash -c 'echo mq-deadline > /sys/block/*/queue/scheduler'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable performance.service

echo "Performance optimizations applied!"
echo "System is now configured for maximum performance."
echo "Please reboot for all changes to take effect."