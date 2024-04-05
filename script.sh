#!/bin/bash

# Specify the number of loops
numberOfLoops=10000

# Use a for loop to execute a specified number of times
for ((i=1; i<=numberOfLoops; i++))
do
    echo "This is the ${i}th loop"

    # Run yarn command
    ore  --rpc https://mainnet.helius-rpc.com/?api-key=c16b9af2-a1ed-4469-8b39-14e632fbedd8 --keypair ~/.config/solana/id.json  --priority-fee 500000 claim

    # Check whether the command was executed successfully
    if [ $? -ne 0 ]; then
        echo "Command execution failed, try to run again..."
    else
        echo "The command was executed successfully and is ready for the next cycle..."
    fi

    # Wait for some time (optional)
    sleep 5
done

echo "loop completed"
