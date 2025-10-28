#!/bin/bash

# Quick Performance Mode Script
# Run with: ./quick_performance.sh

echo "Setting system to maximum performance mode..."

# Set CPU governor to performance immediately
echo "Setting CPU governor to performance..."
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Enable CPU boost
echo "Enabling CPU boost..."
echo 1 | sudo tee /sys/devices/system/cpu/cpufreq/boost

# Set CPU frequency to maximum
echo "Setting CPU frequency to maximum..."
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed; do
    if [ -f "$cpu" ]; then
        max_freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
        echo "$max_freq" | sudo tee "$cpu" > /dev/null 2>&1
    fi
done

# Optimize memory management
echo "Optimizing memory management..."
echo 10 | sudo tee /proc/sys/vm/swappiness

# Set I/O scheduler to mq-deadline
echo "Setting I/O scheduler to mq-deadline..."
echo mq-deadline | sudo tee /sys/block/*/queue/scheduler

# GPU optimizations
echo "Applying GPU optimizations..."
# AMD GPU
if [ -f /sys/class/drm/card*/device/power_dpm_force_performance_level ]; then
    echo high | sudo tee /sys/class/drm/card*/device/power_dpm_force_performance_level
fi

# NVIDIA GPU
if command -v nvidia-smi &> /dev/null; then
    sudo nvidia-smi -pm 1 2>/dev/null
    sudo nvidia-smi -pl 100 2>/dev/null
fi

# Disable CPU idle states
echo "Disabling CPU idle states..."
for cpu in /sys/devices/system/cpu/cpu*/cpuidle/state*/disable; do
    if [ -f "$cpu" ]; then
        echo 1 | sudo tee "$cpu" > /dev/null 2>&1
    fi
done

echo "Performance mode activated!"
echo "CPU governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
echo "CPU frequency: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq) Hz"
echo "Memory swappiness: $(cat /proc/sys/vm/swappiness)"