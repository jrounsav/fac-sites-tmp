<?php

class PersonNodeRestfulBase extends OsNodeRestfulBase {

  public function publicFieldsInfo() {
    $public_fields = parent::publicFieldsInfo();

    $public_fields['address'] = array(
      'property' => 'field_address',
    );

    $public_fields['email'] = array(
      'property' => 'field_email',
    );

    $public_fields['first_name'] = array(
      'property' => 'field_first_name',
    );

    $public_fields['middle_name'] = array(
      'property' => 'field_middle_name_or_initial',
    );

    $public_fields['last_name'] = array(
      'property' => 'field_last_name',
    );

    $public_fields['phone'] = array(
      'property' => 'field_phone',
    );

    $public_fields['prefix'] = array(
      'property' => 'field_prefix',
    );

    $public_fields['professional_title'] = array(
      'property' => 'field_professional_title',
    );

    return $public_fields;
  }

}
