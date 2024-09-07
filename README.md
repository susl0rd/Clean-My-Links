# Clean-My-Links

### This script takes a list of domains (one per line), cleans them up to their core domains,
### removes subdomains, removes duplicates, and filters out invalid entries, IP addresses, IP ranges,
### and partial IP-like patterns

# Usage:
# ./CleanDomains.sh <input_file> [output_file]

# For example it would turn this list
---------------------------------------------------
*.nflxvideo.net<br>
*.prod.dradis.netflix.com<br>
beacon.netflix.com<br>
customerevents.netflix.com<br>
secure.netflix.com<br>
*.nflximg.net<br>
*.nflxso.net<br>
help.netflix.com<br>
ichnaea.netflix.com<br>
presentationtracking.netflix.com<br>

---------------------------------------------------

# Into to this list. Which could be useful for a variety of reasions.
---------------------------------------------------
netflix.com<br>
nflximg.net<br>
nflxso.net<br>
nflxvideo.net<br>

---------------------------------------------------
