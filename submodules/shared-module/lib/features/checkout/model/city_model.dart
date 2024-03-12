import 'package:json_annotation/json_annotation.dart';

/// data : [{"province_id":"e0779e4a-0370-438b-96ae-50c7d0bf6a6d","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Thành phố Cần Thơ","code":92,"code_name":"thanh_pho_can_tho","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090458,"districts":null,"longitude":105.78825,"latitude":10.03711,"postal_code":"900000"},{"province_id":"b1494d7e-25ab-40fb-b276-3be5c47c5c28","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Thành phố Đà Nẵng","code":48,"code_name":"thanh_pho_da_nang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168904960,"districts":null,"longitude":108.18333,"latitude":15.96667,"postal_code":"550000"},{"province_id":"756118dd-5670-4a9e-b092-fcc35f3eba67","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Thành phố Hải Phòng","code":31,"code_name":"thanh_pho_hai_phong","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691352,"districts":null,"longitude":106.68345,"latitude":20.86481,"postal_code":"180000"},{"province_id":"d94e2c30-5867-4832-9070-2d75bc0e9920","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Thành phố Hà Nội","code":1,"code_name":"thanh_pho_ha_noi","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1694696060929,"districts":null,"longitude":105.84117,"latitude":21.0245,"postal_code":"100000"},{"province_id":"75ef0a15-74c7-48c6-8eaf-01e6afa8d2c8","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Thành phố Hồ Chí Minh","code":79,"code_name":"thanh_pho_ho_chi_minh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164986497,"districts":null,"longitude":106.62965,"latitude":10.82302,"postal_code":"700000"},{"province_id":"fcf92472-2c35-4b55-973f-05f38e1c0722","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh An Giang","code":89,"code_name":"tinh_an_giang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164989624,"districts":null,"longitude":105.16667,"latitude":10.5,"postal_code":"880000"},{"province_id":"addba36b-1a20-4888-9b04-177a912c4202","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bắc Giang","code":24,"code_name":"tinh_bac_giang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164989818,"districts":null,"longitude":106.43333,"latitude":21.33333,"postal_code":"230000"},{"province_id":"130b98cf-6723-4f11-98ab-b3db40a3789f","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bắc Kạn","code":6,"code_name":"tinh_bac_kan","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090394,"districts":null,"longitude":105.83333,"latitude":22.25,"postal_code":"260000"},{"province_id":"82366536-df5b-4043-ab57-b2757a50b5ac","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bạc Liêu","code":95,"code_name":"tinh_bac_lieu","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164990159,"districts":null,"longitude":105.5,"latitude":9.3,"postal_code":"960000"},{"province_id":"d47198c0-fddf-4497-8ab2-1f8b6f8ee360","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bắc Ninh","code":27,"code_name":"tinh_bac_ninh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164989754,"districts":null,"longitude":106.1,"latitude":21.1,"postal_code":"220000"},{"province_id":"e0e73e90-68e5-481a-881b-5c9cb7bacde1","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bà Rịa - Vũng Tàu","code":77,"code_name":"tinh_ba_ria_vung_tau","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164989690,"districts":null,"longitude":107.08426,"latitude":10.34599,"postal_code":"790000"},{"province_id":"472ac8e0-8ad9-4ecd-a306-8a5da097d6fc","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bến Tre","code":83,"code_name":"tinh_ben_tre","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164990234,"districts":null,"longitude":106.5,"latitude":10.16667,"postal_code":"930000"},{"province_id":"659c75c5-53d2-48ed-b8ad-d41933785484","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bình Định","code":52,"code_name":"tinh_binh_dinh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164989954,"districts":null,"longitude":109,"latitude":14.16667,"postal_code":"590000"},{"province_id":"7f94aa00-be1f-4e93-958b-c7c0bc90c2eb","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bình Dương","code":74,"code_name":"tinh_binh_duong","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164989882,"districts":null,"longitude":106.66667,"latitude":11.16667,"postal_code":"820000"},{"province_id":"b0a13a84-0e49-437f-a293-bd663bdacbac","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bình Phước","code":70,"code_name":"tinh_binh_phuoc","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164990018,"districts":null,"longitude":106.91667,"latitude":11.75,"postal_code":"830000"},{"province_id":"7848489a-ee12-4a8b-a151-cdc42273e6fc","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Bình Thuận","code":60,"code_name":"tinh_binh_thuan","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698164990084,"districts":null,"longitude":108.08333,"latitude":11.08333,"postal_code":"800000"},{"province_id":"335a1028-71bc-4d8b-9517-a6339366464f","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Cà Mau","code":96,"code_name":"tinh_ca_mau","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090905,"districts":null,"longitude":105.08333,"latitude":9.08333,"postal_code":"970000"},{"province_id":"b434cace-4dec-4e54-b4fc-b6e7b3461176","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Cao Bằng","code":4,"code_name":"tinh_cao_bang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090969,"districts":null,"longitude":106.08333,"latitude":22.75,"postal_code":"270000"},{"province_id":"8003921b-23fe-495a-9e93-4e203efb526f","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Đắk Lắk","code":66,"code_name":"tinh_dak_lak","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168904873,"districts":null,"longitude":0,"latitude":0,"postal_code":"630000"},{"province_id":"89009434-f386-48c0-ae97-59d8ade0420b","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Đắk Nông","code":67,"code_name":"tinh_dak_nong","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168905022,"districts":null,"longitude":0,"latitude":0,"postal_code":"640000"},{"province_id":"2fea60a6-8bcf-4400-8716-13aa44ef27d6","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Điện Biên","code":11,"code_name":"tinh_dien_bien","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168905149,"districts":null,"longitude":0,"latitude":0,"postal_code":"380000"},{"province_id":"144f0a27-e88d-49ce-ad3e-616e4db90f7e","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Đồng Nai","code":75,"code_name":"tinh_dong_nai","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090777,"districts":null,"longitude":107.16667,"latitude":11,"postal_code":"810000"},{"province_id":"18105e5d-4d8c-47e5-a8a3-7a7216870ad8","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Đồng Tháp","code":87,"code_name":"tinh_dong_thap","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1694359622543,"districts":null,"longitude":105.63333,"latitude":10.58333,"postal_code":"870000"},{"province_id":"cf7c8b8e-dfd7-4570-a91f-2ec170061310","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Gia Lai","code":64,"code_name":"tinh_gia_lai","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165091033,"districts":null,"longitude":108.25,"latitude":13.75,"postal_code":"600000"},{"province_id":"7dce17a3-16c7-42e2-8045-d4c5d54cab6c","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hà Giang","code":2,"code_name":"tinh_ha_giang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165091100,"districts":null,"longitude":105,"latitude":22.75,"postal_code":"310000"},{"province_id":"10290947-7b8c-4f3a-80f1-bac04a57299a","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hải Dương","code":30,"code_name":"tinh_hai_duong","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691291,"districts":null,"longitude":106.33333,"latitude":20.91667,"postal_code":"170000"},{"province_id":"abd210aa-e77a-4a6a-a1d0-36458d53a772","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hà Nam","code":35,"code_name":"tinh_ha_nam","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691165,"districts":null,"longitude":105.96667,"latitude":20.53333,"postal_code":"400000"},{"province_id":"9ca6ac1c-cbf4-43be-93c8-aebb8563a076","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hà Tĩnh","code":42,"code_name":"tinh_ha_tinh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691228,"districts":null,"longitude":105.75,"latitude":18.33333,"postal_code":"480000"},{"province_id":"3fe2b627-9e3b-49e7-beeb-1574b7dc8de1","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hậu Giang","code":93,"code_name":"tinh_hau_giang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168905085,"districts":null,"longitude":105.46412,"latitude":9.77605,"postal_code":"910000"},{"province_id":"12cc4689-a9ce-4ebc-b24e-904cda8c1007","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hoà Bình","code":17,"code_name":"tinh_hoa_binh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691415,"districts":null,"longitude":105.33759,"latitude":20.81717,"postal_code":"350000"},{"province_id":"8648e0d5-ba83-4759-9bca-636dbabb59a1","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Hưng Yên","code":33,"code_name":"tinh_hung_yen","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691477,"districts":null,"longitude":106.05,"latitude":20.81667,"postal_code":"160000"},{"province_id":"36722d41-313a-49ab-b77e-507852194c58","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Khánh Hòa","code":56,"code_name":"tinh_khanh_hoa","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090524,"districts":null,"longitude":109,"latitude":12.33333,"postal_code":"650000"},{"province_id":"40ac5790-8186-4fea-acb8-b439d0ba22fb","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Kiên Giang","code":91,"code_name":"tinh_kien_giang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165138236,"districts":null,"longitude":105.16667,"latitude":10,"postal_code":"920000"},{"province_id":"0ec6473a-9760-4f22-ae02-3e120727f7f2","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Kon Tum","code":62,"code_name":"tinh_kon_tum","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691564,"districts":null,"longitude":107.91667,"latitude":14.75,"postal_code":"580000"},{"province_id":"cc238b68-7092-4842-8924-320cb669fd0f","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Lai Châu","code":12,"code_name":"tinh_lai_chau","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691627,"districts":null,"longitude":103.25,"latitude":22.28333,"postal_code":"390000"},{"province_id":"eeebe5af-18c0-4bd7-a61b-26e0d1991f89","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Lâm Đồng","code":68,"code_name":"tinh_lam_dong","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691691,"districts":null,"longitude":108.08333,"latitude":11.66667,"postal_code":"670000"},{"province_id":"43af9382-c253-432d-9d95-073ecf03b201","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Lạng Sơn","code":20,"code_name":"tinh_lang_son","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691753,"districts":null,"longitude":106.58333,"latitude":21.83333,"postal_code":"240000"},{"province_id":"69311631-f235-4919-af28-0a01a93cd6a7","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Lào Cai","code":10,"code_name":"tinh_lao_cai","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090651,"districts":null,"longitude":104.16667,"latitude":22.3,"postal_code":"330000"},{"province_id":"a916f92b-de6b-4c44-8305-348530339638","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Long An","code":80,"code_name":"tinh_long_an","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691816,"districts":null,"longitude":105.43518,"latitude":10.38639,"postal_code":"850000"},{"province_id":"7463845e-98cd-492a-aacc-20218554f1c5","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Nam Định","code":36,"code_name":"tinh_nam_dinh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168368580,"districts":null,"longitude":0,"latitude":0,"postal_code":"420000"},{"province_id":"46d52985-1fef-48d2-a03d-96a8044c1c4b","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Nghệ An","code":40,"code_name":"tinh_nghe_an","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691879,"districts":null,"longitude":104.91667,"latitude":19.25,"postal_code":"460000"},{"province_id":"652a93d8-20ca-470e-aece-71ebe108ab99","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Ninh Bình","code":37,"code_name":"tinh_ninh_binh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168691941,"districts":null,"longitude":105.9,"latitude":20.23333,"postal_code":"430000"},{"province_id":"714b2a8b-1cc0-4889-a098-31334decc52f","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Ninh Thuận","code":58,"code_name":"tinh_ninh_thuan","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850524,"districts":null,"longitude":108.83333,"latitude":11.75,"postal_code":"660000"},{"province_id":"95a7d389-d964-4ea5-a9c0-b61e027123aa","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Phú Thọ","code":25,"code_name":"tinh_phu_tho","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850587,"districts":null,"longitude":105.13333,"latitude":21.33333,"postal_code":"290000"},{"province_id":"0cac5c76-c91c-4877-bc6a-0b393c6f32ba","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Phú Yên","code":54,"code_name":"tinh_phu_yen","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850648,"districts":null,"longitude":109.08333,"latitude":13.16667,"postal_code":"620000"},{"province_id":"aba98200-0740-4d2d-93c9-a00d970e2860","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Quảng Bình","code":44,"code_name":"tinh_quang_binh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850713,"districts":null,"longitude":106.33333,"latitude":17.5,"postal_code":"510000"},{"province_id":"cc4aec2d-cb5d-4508-a08b-a2b701e751c5","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Quảng Nam","code":49,"code_name":"tinh_quang_nam","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850775,"districts":null,"longitude":107.91667,"latitude":15.58333,"postal_code":"560000"},{"province_id":"98e5adc9-1c3c-42e2-86e2-bd9ab183f952","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Quảng Ngãi","code":51,"code_name":"tinh_quang_ngai","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850837,"districts":null,"longitude":108.66667,"latitude":15,"postal_code":"570000"},{"province_id":"300af8f2-6223-4f41-bca2-ab4b724c5a5d","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Quảng Ninh","code":22,"code_name":"tinh_quang_ninh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698165090714,"districts":null,"longitude":107.33333,"latitude":21.25,"postal_code":"200000"},{"province_id":"a2c2339a-70ce-444a-a8a0-2531b93256a4","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Quảng Trị","code":45,"code_name":"tinh_quang_tri","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850901,"districts":null,"longitude":107,"latitude":16.75,"postal_code":"520000"},{"province_id":"a6b9cab6-a2d8-41c1-9a63-603bd482791a","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Sóc Trăng","code":94,"code_name":"tinh_soc_trang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168850964,"districts":null,"longitude":105.91667,"latitude":9.55,"postal_code":"950000"},{"province_id":"fc1122f2-ece9-4613-908e-237b7110ac94","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Sơn La","code":14,"code_name":"tinh_son_la","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851026,"districts":null,"longitude":104,"latitude":21.16667,"postal_code":"360000"},{"province_id":"653bd47e-0f55-41f6-967b-9817f36884f6","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Tây Ninh","code":72,"code_name":"tinh_tay_ninh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851095,"districts":null,"longitude":106.09828,"latitude":11.31004,"postal_code":"840000"},{"province_id":"e5822da1-ff65-4068-931a-d99014110449","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Thái Bình","code":34,"code_name":"tinh_thai_binh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851159,"districts":null,"longitude":106.36667,"latitude":20.5,"postal_code":"410000"},{"province_id":"7e2679ab-e33d-4410-953e-50eb05828f4b","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Thái Nguyên","code":19,"code_name":"tinh_thai_nguyen","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851221,"districts":null,"longitude":105.84817,"latitude":21.59422,"postal_code":"250000"},{"province_id":"7afe257b-ccb1-4fc9-ad57-b2ce7b774bd6","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Thanh Hóa","code":38,"code_name":"tinh_thanh_hoa","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851284,"districts":null,"longitude":105.33333,"latitude":20.06667,"postal_code":"440000"},{"province_id":"83263cf6-4578-4874-9da3-f954362080b6","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Thừa Thiên Huế","code":46,"code_name":"tinh_thua_thien_hue","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168368390,"districts":null,"longitude":107.59546,"latitude":16.4619,"postal_code":"530000"},{"province_id":"58c349b4-ebbe-496f-b174-7f70f6946123","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Tiền Giang","code":82,"code_name":"tinh_tien_giang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851349,"districts":null,"longitude":106.3,"latitude":10.4,"postal_code":"860000"},{"province_id":"b5a107e0-5a9a-46c2-a2ed-ba5cdf3101bf","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Trà Vinh","code":84,"code_name":"tinh_tra_vinh","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851416,"districts":null,"longitude":106.3,"latitude":9.8,"postal_code":"940000"},{"province_id":"26160766-64ce-4738-8c01-a879061ec8a1","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Tuyên Quang","code":8,"code_name":"tinh_tuyen_quang","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168851479,"districts":null,"longitude":105.25,"latitude":22.11667,"postal_code":"300000"},{"province_id":"1e5db90d-6c5b-4a19-9b36-480fed4deec8","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Vĩnh Long","code":86,"code_name":"tinh_vinh_long","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168904686,"districts":null,"longitude":106,"latitude":10.1,"postal_code":"890000"},{"province_id":"e95d9b35-b221-42de-982e-565664437c11","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Vĩnh Phúc","code":26,"code_name":"tinh_vinh_phuc","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168904749,"districts":null,"longitude":105.56667,"latitude":21.33333,"postal_code":"280000"},{"province_id":"75a32c0c-33cc-4b30-8a6c-15fcecea0c9e","country_id":"1e5effa4-c844-48ee-a7b7-3f3c62ffc883","country_name":"Việt Nam","province_name":"Tỉnh Yên Bái","code":15,"code_name":"tinh_yen_bai","support_type":"DELIVERY","status":"UNLOCK","created_at":1691746765799,"updated_at":1698168904811,"districts":null,"longitude":104.58333,"latitude":21.75,"postal_code":"320000"}]
/// error : null
/// success : true
part 'city_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class CityModel {
  final List<ItemCity>? data;

  CityModel({this.data});

  CityModel copyWith({
    List<ItemCity>? data,
  }) {
    return CityModel(
      data: data ?? this.data,
    );
  }

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return _$CityModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CityModelToJson(this);
  }
}

/// province_id : "e0779e4a-0370-438b-96ae-50c7d0bf6a6d"
/// country_id : "1e5effa4-c844-48ee-a7b7-3f3c62ffc883"
/// country_name : "Việt Nam"
/// province_name : "Thành phố Cần Thơ"
/// code : 92
/// code_name : "thanh_pho_can_tho"
/// support_type : "DELIVERY"
/// status : "UNLOCK"
/// created_at : 1691746765799
/// updated_at : 1698165090458
/// districts : null
/// longitude : 105.78825
/// latitude : 10.03711
/// postal_code : "900000"

class ItemCity {
  ItemCity({
      String? provinceId, 
      String? countryId, 
      String? countryName, 
      String? provinceName, 
      num? code, 
      String? codeName, 
      String? supportType, 
      String? status, 
      num? createdAt, 
      num? updatedAt, 
      dynamic districts, 
      num? longitude, 
      num? latitude, 
      String? postalCode,}){
    _provinceId = provinceId;
    _countryId = countryId;
    _countryName = countryName;
    _provinceName = provinceName;
    _code = code;
    _codeName = codeName;
    _supportType = supportType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _districts = districts;
    _longitude = longitude;
    _latitude = latitude;
    _postalCode = postalCode;
}

  ItemCity.fromJson(dynamic json) {
    _provinceId = json['province_id'];
    _countryId = json['country_id'];
    _countryName = json['country_name'];
    _provinceName = json['province_name'];
    _code = json['code'];
    _codeName = json['code_name'];
    _supportType = json['support_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _districts = json['districts'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _postalCode = json['postal_code'];
  }
  String? _provinceId;
  String? _countryId;
  String? _countryName;
  String? _provinceName;
  num? _code;
  String? _codeName;
  String? _supportType;
  String? _status;
  num? _createdAt;
  num? _updatedAt;
  dynamic _districts;
  num? _longitude;
  num? _latitude;
  String? _postalCode;
ItemCity copyWith({  String? provinceId,
  String? countryId,
  String? countryName,
  String? provinceName,
  num? code,
  String? codeName,
  String? supportType,
  String? status,
  num? createdAt,
  num? updatedAt,
  dynamic districts,
  num? longitude,
  num? latitude,
  String? postalCode,
}) => ItemCity(  provinceId: provinceId ?? _provinceId,
  countryId: countryId ?? _countryId,
  countryName: countryName ?? _countryName,
  provinceName: provinceName ?? _provinceName,
  code: code ?? _code,
  codeName: codeName ?? _codeName,
  supportType: supportType ?? _supportType,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  districts: districts ?? _districts,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
  postalCode: postalCode ?? _postalCode,
);
  String? get provinceId => _provinceId;
  String? get countryId => _countryId;
  String? get countryName => _countryName;
  String? get provinceName => _provinceName;
  num? get code => _code;
  String? get codeName => _codeName;
  String? get supportType => _supportType;
  String? get status => _status;
  num? get createdAt => _createdAt;
  num? get updatedAt => _updatedAt;
  dynamic get districts => _districts;
  num? get longitude => _longitude;
  num? get latitude => _latitude;
  String? get postalCode => _postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['province_id'] = _provinceId;
    map['country_id'] = _countryId;
    map['country_name'] = _countryName;
    map['province_name'] = _provinceName;
    map['code'] = _code;
    map['code_name'] = _codeName;
    map['support_type'] = _supportType;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['districts'] = _districts;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['postal_code'] = _postalCode;
    return map;
  }

}