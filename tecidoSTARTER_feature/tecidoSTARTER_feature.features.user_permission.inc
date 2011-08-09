<?php

/**
 * Implementation of hook_user_default_permissions().
 */
function tecidoSTARTER_feature_user_default_permissions() {
  $permissions = array();

  // Exported permission: create tecidoSTARTER_feature content
  $permissions['create tecidoSTARTER_feature content'] = array(
    'name' => 'create tecidoSTARTER_feature content',
    'roles' => array(
      '0' => 'administrator',
      '1' => 'authenticated user',
    ),
  );

  // Exported permission: delete own tecidoSTARTER_feature content
  $permissions['delete own tecidoSTARTER_feature content'] = array(
    'name' => 'delete own tecidoSTARTER_feature content',
    'roles' => array(
      '0' => 'administrator',
      '1' => 'authenticated user',
    ),
  );

  // Exported permission: edit own tecidoSTARTER_feature content
  $permissions['edit own tecidoSTARTER_feature content'] = array(
    'name' => 'edit own tecidoSTARTER_feature content',
    'roles' => array(
      '0' => 'administrator',
      '1' => 'authenticated user',
    ),
  );

  return $permissions;
}
