region-newrelic = "US"

my-conditions = {
  "condiiton1" = {
    name = "cpuPercent"
    description = "cpu usage percentage"
    enabled = true
    fill_option_value = "last_value"
    violation_time_limit_seconds = 3600
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "FROM SystemSample SELECT average(cpuPercent) WHERE entityName = 'DESKTOP-1FTVP0P'"
    critical_threshold = 80
    warning_threshold = 60
    crt_threshold_duration = 300
    war_threshold_duration = 300
  }, 
  "condition2" = {
    name = "memoryPercent"
    description = "memory usage percentage"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "FROM SystemSample SELECT average(memoryUsedPercent) WHERE entityName = 'DESKTOP-1FTVP0P'"
    critical_threshold = 80
    warning_threshold = 60
    crt_threshold_duration = 300
    war_threshold_duration = 300
  }, 
  "condition3" = {    
    name = "diskPercent"
    description = "disk usage percentage"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "FROM SystemSample SELECT average(diskUsedPercent) WHERE entityName = 'DESKTOP-1FTVP0P'"
    critical_threshold = 80
    warning_threshold = 60
    crt_threshold_duration = 300
    war_threshold_duration = 300
  }, 
  "condition4" = {
    name = "networkIngress"
    description = "network Ingress"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "SELECT average(receiveBytesPerSecond) FROM NetworkSample WHERE entityName = 'DESKTOP-1FTVP0P'"
    critical_threshold = 1000
    warning_threshold = 800
    crt_threshold_duration = 300
    war_threshold_duration = 300
  }, 
  "condition5" = {
    name = "networkEgress"
    description = "network Egress"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "SELECT average(transmitBytesPerSecond) FROM NetworkSample WHERE entityName = 'DESKTOP-1FTVP0P'"
    critical_threshold = 1000
    warning_threshold = 800
    crt_threshold_duration = 300
    war_threshold_duration = 300
  }
}

recipient-email = "xshreya.sharma@gmail.com"

