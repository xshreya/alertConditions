# POLICY CREATION
resource "newrelic_alert_policy" "policy01" {
  name = "policy01"
  incident_preference = "PER_CONDITION" # PER_POLICY is default
}


# CONDITION 
resource "newrelic_nrql_alert_condition" "condition" {
  for_each = var.my-conditions
  policy_id                      = newrelic_alert_policy.policy01.id
  account_id                     = var.nr_account_id
  name                           = each.value.name
  description                    = each.value.description
  # runbook_url                    = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = each.value.fill_option_value
  # fill_value                     = 1.0
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = each.value.query
  }

  critical {
    operator              = "above"
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.crt_threshold_duration
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.war_threshold_duration
    threshold_occurrences = "ALL"
  }
}


#DESTINATION 
resource "newrelic_notification_destination" "destinaiton01" {
  account_id = var.nr_account_id
  name = "destination01"
  type = "EMAIL"

  property {
    key = "email"
    value = var.recipient-email
  }
}


#CHANNEL 
resource "newrelic_notification_channel" "channel01" {
  account_id = var.nr_account_id
  name = "channel01"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.destinaiton01.id
  product = "IINT"

  property {
    key = "subject"
    value = "ALERT!"
  }

  property {
    key = "customDetailsEmail"
    value = "Changes in the Infrastructure"
  }
}

# WORKFLOW 
resource "newrelic_workflow" "workflow01" {
  name = "workflow01"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter"
    type = "FILTER"

    predicate {
      attribute = "priority"
      operator = "EXACTLY_MATCHES"
      values = [ "critical" ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.channel01.id
  }
}

