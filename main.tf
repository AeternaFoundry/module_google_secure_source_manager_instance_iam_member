resource "google_secure_source_manager_instance_iam_member" "secure_source_manager_instance_iam_members" {
  for_each = var.secure_source_manager_instance_iam_members

  instance_id = each.value.instance_id
  member      = each.value.member
  role        = each.value.role
  location    = each.value.location
  project     = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

