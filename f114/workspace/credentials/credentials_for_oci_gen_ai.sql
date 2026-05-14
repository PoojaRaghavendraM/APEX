prompt --workspace/credentials/credentials_for_oci_gen_ai
begin
--   Manifest
--     CREDENTIAL: Credentials for oci gen ai
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(57678009961942856)
,p_name=>'Credentials for oci gen ai'
,p_static_id=>'credentials_for_oci_gen_ai'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1..aaaaaaaasqduxc6ypqhclu6ez6bnk72qs6fcgsykbtlosufzn42xqclqwhia'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://inference.generativeai.ap-hyderabad-1.oci.oraclecloud.com',
''))
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
