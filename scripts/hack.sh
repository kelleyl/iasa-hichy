#!/bin/bash

# Record start time
start_time=$SECONDS
duration=36000  # 10 hours in seconds

echo "Starting pipeline loop for 1 hour..."

while [ $((SECONDS - start_time)) -lt $duration ]; do
    echo "Running scripts/run_clams_pipeline.sh at $(date)"
    ./scripts/run_clams_pipeline.sh
    
    # Check if we still have time left
    elapsed=$((SECONDS - start_time))
    remaining=$((duration - elapsed))
    
    if [ $remaining -gt 0 ]; then
        echo "Pipeline completed. Elapsed time: ${elapsed}s, remaining: ${remaining}s"
        echo "Starting next run..."
    else
        echo "Time limit reached. Stopping."
        break
    fi
done

echo "Pipeline loop completed after $((SECONDS - start_time)) seconds"
