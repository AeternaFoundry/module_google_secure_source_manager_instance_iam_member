variable "secure_source_manager_instance_iam_members" {
  description = <<EOT
Map of secure_source_manager_instance_iam_members, attributes below
Required:
    - instance_id
    - member
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    instance_id = string
    member      = string
    role        = string
    location    = optional(string)
    project     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

