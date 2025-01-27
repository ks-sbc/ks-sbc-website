#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Test URLs
DEV_URL="https://dev.kssocialistbookclub.com"
PROD_URL="https://kssocialistbookclub.com"

# Function to check HTTPS and security headers
check_security() {
    local url=$1
    local name=$2
    
    echo -e "\n${GREEN}Testing HTTPS and security headers for $name ($url)${NC}"
    
    # Check HTTPS certificate
    echo -n "HTTPS Certificate: "
    if curl -sI "$url" | grep -i "HTTP/2 200" > /dev/null; then
        echo -e "${GREEN}Valid${NC}"
    else
        echo -e "${RED}Invalid${NC}"
    fi
    
    # Get and display security headers
    echo -e "\nSecurity Headers:"
    curl -sI "$url" | grep -i -E "strict-transport-security:|content-security-policy:|x-content-type-options:|x-frame-options:|x-xss-protection:"
}

# Function to check CDN caching
check_cdn_caching() {
    local url=$1
    local name=$2
    
    echo -e "\n${GREEN}Testing CDN caching for $name ($url)${NC}"
    
    # Check for CDN headers
    echo -e "\nCDN Headers:"
    curl -sI "$url" | grep -i -E "x-cache:|x-cache-hits:|cache-control:|age:"
}

# Main testing sequence
echo -e "${GREEN}Starting deployment verification tests...${NC}"

# Test development environment
echo -e "\n${GREEN}Testing Development Environment${NC}"
check_security "$DEV_URL" "Development"
check_cdn_caching "$DEV_URL" "Development"

# Test production environment
echo -e "\n${GREEN}Testing Production Environment${NC}"
check_security "$PROD_URL" "Production"
check_cdn_caching "$PROD_URL" "Production"

echo -e "\n${GREEN}Deployment verification tests completed${NC}"
