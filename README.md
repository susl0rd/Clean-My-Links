# Clean-My-Links

### This script takes a list of domains (one per line), cleans them up to their core domains,
### removes subdomains, removes duplicates, and filters out invalid entries, IP addresses, IP ranges,
### and partial IP-like patterns

# Usage:
# ./CleanDomains.sh <input_file> [output_file]

# For example it would turn this list
---------------------------------------------------
*.nflxvideo.net<br>
*.prod.dradis.netflix.com
beacon.netflix.com
customerevents.netflix.com
secure.netflix.com
*.nflximg.net
*.nflxso.net
help.netflix.com
ichnaea.netflix.com
presentationtracking.netflix.com

---------------------------------------------------

# Into to this list. Which could be useful for a variety of reasions.
---------------------------------------------------
netflix.com
nflximg.net
nflxso.net
nflxvideo.net

---------------------------------------------------
