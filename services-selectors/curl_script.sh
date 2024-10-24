#!/bin/bash

# Run kubectl proxy on port 8080 in the background
kubectl proxy --port=8080 &
PROXY_PID=$!

# Wait a moment to ensure proxy is up
sleep 3

# Initialize counters for each pod
POD1_COUNT=0
POD2_COUNT=0
POD3_COUNT=0

# Run 20 curl commands and grep "Hello", display output on command line and count occurrences
for i in {1..20}; do
  RESPONSE=$(curl -s http://localhost:8080/api/v1/namespaces/default/services/nginx-service1/proxy/)
  echo "$RESPONSE" | grep "Hello"
  if echo "$RESPONSE" | grep -q "Pod 1"; then
    ((POD1_COUNT++))
  elif echo "$RESPONSE" | grep -q "Pod 2"; then
    ((POD2_COUNT++))
  elif echo "$RESPONSE" | grep -q "Pod 3"; then
    ((POD3_COUNT++))
  fi
done

# Display counts for each pod
echo ""
echo "Service 1"
echo "Pod 1 was called $POD1_COUNT times."
echo "Pod 2 was called $POD2_COUNT times."
echo "Pod 3 was called $POD3_COUNT times."

# Stop the kubectl proxy
kill $PROXY_PID

# ======================
# Switching to svc 2
# ======================

# Run kubectl proxy again on port 8080 in the background
kubectl proxy --port=8080 &
PROXY_PID=$!

# Wait a moment to ensure proxy is up
sleep 3

# Reset counters for each pod
POD1_COUNT=0
POD2_COUNT=0
POD3_COUNT=0

# Run another 20 curl commands and grep "Hello", display output on command line and count occurrences
for i in {1..20}; do
  RESPONSE=$(curl -s http://localhost:8080/api/v1/namespaces/default/services/nginx-service2/proxy/)
  echo "$RESPONSE" | grep "Hello"
  if echo "$RESPONSE" | grep -q "Pod 1"; then
    ((POD1_COUNT++))
  elif echo "$RESPONSE" | grep -q "Pod 2"; then
    ((POD2_COUNT++))
  elif echo "$RESPONSE" | grep -q "Pod 3"; then
    ((POD3_COUNT++))
  fi
done

# Display counts for each pod
echo ""
echo "Service 2"
echo "Pod 1 was called $POD1_COUNT times."
echo "Pod 2 was called $POD2_COUNT times."
echo "Pod 3 was called $POD3_COUNT times."

# Stop the kubectl proxy
kill $PROXY_PID

# ======================
# Switching to svc 2
# ======================

# Done
echo "Curl requests complete."
