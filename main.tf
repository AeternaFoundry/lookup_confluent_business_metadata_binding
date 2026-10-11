data "confluent_business_metadata_binding" "business_metadata_binding_lookup" {
  for_each = var.business_metadata_binding_lookup

  business_metadata_name = each.value.business_metadata_name
  entity_name            = each.value.entity_name
  entity_type            = each.value.entity_type
  rest_endpoint          = each.value.rest_endpoint

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "schema_registry_cluster" {
    for_each = each.value.schema_registry_cluster != null ? [each.value.schema_registry_cluster] : []
    content {
      id = schema_registry_cluster.value.id
    }
  }
}

