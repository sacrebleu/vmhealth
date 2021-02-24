# vmhealth
#### Author: Jeremy Botha

vmhealth is a small ruby 2.7 application that aggregates victoriametrics + other
endpoints into a small set of prometheus metrics for ingestion.

Example output:

    $ curl localhost:3000/
    # HELP vmhealth_endpoints_total The number of configured endpoints grouped by type for this region
    # TYPE vmhealth_endpoints_total counter
    vmhealth_endpoints_total{type="storage"} 3
    vmhealth_endpoints_total{type="alert"} 1
    vmhealth_endpoints_total{type="insert"} 1
    vmhealth_endpoints_total{type="select"} 1
    vmhealth_endpoints_total{type="agent"} 6
    vmhealth_endpoints_total{type="minerva"} 1
    vmhealth_endpoints_total{type="grafana"} 1
    vmhealth_endpoints_total{type="proxy"} 1
    
    # HELP vmhealth_endpoints_available The count of reachable endpoints grouped by type for this region
    # TYPE vmhealth_endpoints_available counter
    vmhealth_endpoints_available{type="storage"} 0
    vmhealth_endpoints_available{type="alert"} 1
    vmhealth_endpoints_available{type="insert"} 1
    vmhealth_endpoints_available{type="select"} 1
    vmhealth_endpoints_available{type="agent"} 6
    vmhealth_endpoints_available{type="minerva"} 1
    vmhealth_endpoints_available{type="grafana"} 1
    vmhealth_endpoints_available{type="proxy"} 1

