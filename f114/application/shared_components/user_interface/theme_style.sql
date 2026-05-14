prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(47481543732027012)
,p_theme_id=>42
,p_name=>'Vita (Integrisync)'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#ffe600","@g_Nav-Active-BG":"#ffe600","@g_Nav-Active-FG":"#1a1a24","@g_Accent-OG":"#ffffff","@g_Nav_Style":"light","@g_Disabled-BG":"#707070","@g_Disabled-FG":"#070606"},"customCSS":".t-Body-contentInner {\n    b'
||'ackground: var(--primary-ey-white-ffffff, #FFF);\n}\n.t-Region-headerItems--title {\n    color: #000;\n\tfont-feature-settings: ''clig'' off, ''liga'' off;\n\t\n\t/* H5 Heading/Dark/Bold/Left */\n\tfont-family: EYInterstate;\n\tfont-size: 16px;\n\tfont-s'
||'tyle: normal;\n\tfont-weight: 700;\n\tline-height: 22px; /* 137.5% */\n}\n.a-IRR-search-field{\n   display: flex;\n\twidth: 341px;\n\theight: 44px;\n\tjustify-content: center;\n\talign-items: flex-start;\n\tflex-shrink: 0;\n}\n.a-IRR-content {\n\tfle'
||'x-shrink: 0;\n\tbackground-color: #1A1A24;\n\tcolor: #FFFFFF;\n}\n.a-IRR-header {\n  background-color: #FFE600;  \n}\n.a-IRR-headerLink {\n    height: 44px;\n\tflex-shrink: 0;\n\tbackground-color:#FFE600;\n\tcolor: #1A1A24;;\n}\n.a-GV-headerLink {\n '
||'   height: 44px;\n\tflex-shrink: 0;\n\tbackground-color: #FFE600;\n\tcolor: #1A1A24;\n}\n.a-GV-table td, .a-GV-table th  {\n\tflex-shrink: 0;\n\tbackground-color: #1A1A24;\n\tcolor: #FFFFFF;\n}\n.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerG'
||'roup {\n  background-color:#FFE600;  \n  color: #1A1A24;\n}\n.fa-trash:before {\n    display: flex;\n\talign-items: center;\n\tflex-shrink: 0;\n\tcolor: #FFFFFF;\n}\n.fa-edit:before {\n    display: flex;\n\tflex-direction: column;\n\tjustify-content:'
||' center;\n\talign-items: center;\n\tflex-shrink: 0;\n\tcolor: #FFFFFF;\n}\n.a-IRR-pagination {\n    display: flex;\n\tjustify-content: space-between;\n\talign-items: flex-start;\n\tflex-shrink: 0;\n}\n.a-IRR-buttons .t-Button {\n    border: 1px solid'
||' var(--specif-use-colors-default-text-icon-2-e-2-e-38, #2E2E38);\n\tbackground: var(--Primary-Yellow, #FFE600);\n\tdisplay: flex;\n\twidth: 95px;\n\tpadding: 11px 36px 11px 32px;\n\tjustify-content: center;\n\talign-items: center;\n\tgap: 2px;\n}\n.f'
||'a-plus-circle:before {\n    width: 18px;\n\theight: 18px;\n\tflex-shrink: 0;\n}\n.t-Button-label {\n    color: var(--specif-use-colors-default-text-icon-2-e-2-e-38, #2E2E38);\n\tfont-feature-settings: ''clig'' off, ''liga'' off;\n\n\t/* Body/Body 1 (14)/'
||'Dark/Bold/Centered */\n\tfont-family: EYInterstate;\n\tfont-size: 14px;\n\tfont-style: normal;\n\tfont-weight: 700;\n\tline-height: 22px; /* 157.143% */\n}\n.t-Cards--featured .t-Card-wrap {\n    width: 400px;\n\theight: 200px;\n\tflex-shrink: 0;\n\t'
||'border-radius: 4px;\n\tbackground: url(<path-to-image>) lightgray 50% / cover no-repeat;\n}\n.t-Card-body {\n\tflex-shrink: 0;\n\tborder-radius: 6px;\n\topacity: 0.84;\n\tbackground: var(--primary-ey-yellow-ffe-600, #FFE600);\n}\n.t-NavigationBar-ite'
||'m.has-username .t-Button-label {\n    color: #FFF;\n\tfont-family: EYInterstate;\n\tfont-size: 14px;\n\tfont-style: normal;\n\tfont-weight: 400;\n\tline-height: normal;\n}\n.t-Header-branding {\n\theight: 56px;\n\tflex-shrink: 0;\n\tborder: 1px solid'
||' #000;\n\tbackground-color: #1A1A24;\n\tcolor: #FFFFFF;\n}\n.t-Header-logo-link img {\n    width: 34px;\n\theight: 35px;\n\tflex-shrink: 0;\n}\n:root {\n  --a-gv-row-hover-background-color: #1A1A24;\n}\n.a-GV-row.is-updated .a-GV-cell {\n\tbackground'
||'-color: #1A1A24;\n    color: #FFFFFF;\n}\n.a-GV--editMode .a-GV-row.is-readonly .a-GV-cell, .a-GV--editMode .a-GV-cell.is-readonly {\n\tbackground-color: #1A1A24;\n    color: #FFFFFF;\n}\n.a-GV-row.is-inserted .a-GV-cell {\n    background-color: #1A1'
||'A24;\n    color: #FFFFFF;\n}\n.a-CardView-buttonIcon, .t-Button .a-Icon, .t-Button .t-Icon, .t-Button-icon {\n    vertical-align: middle;\n}\n.t-Cards--featured .t-Card-wrap {\n    height: 150px;\n}\n","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#47481543732027012.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp.component_end;
end;
/
