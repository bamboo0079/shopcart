<?php echo $header; ?>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-links"><?php echo $tab_links; ?></a><a href="#tab-attribute"><?php echo $tab_attribute; ?></a><a href="#tab-option"><?php echo $tab_option; ?></a><a href="#tab-special"><?php echo $tab_special; ?></a><a href="#tab-image"><?php echo $tab_image; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
        <table class="form">
            <tr>
              <td>Chính sách:</td>
              <td><?php foreach($policies as $item){?>
                <?php if($policy == $item['id']){?>
                <input type="radio" name="policy" value="<?php echo $item['id']?>" id="policy-<?php echo $item['id']?>" checked="checked"/>
                <label for="policy-<?php echo $item['id']?>"><b><?php echo $item['category']?></b> - <?php echo $item['name']?>
                  <?php if($item['status'] == 0){?>
                  <span style="color:#F00">(Đang tắt)</span>
                  <?php }?>
                </label>
                <br />
                <?php }else{?>
                <input type="radio" name="policy" value="<?php echo $item['id']?>" id="policy-<?php echo $item['id']?>"/>
                <label for="policy-<?php echo $item['id']?>"><b><?php echo $item['category']?></b> - <?php echo $item['name']?>
                  <?php if($item['status'] == 0){?>
                  <span style="color:#F00">(Đang tắt)</span>
                  <?php }?>
                </label>
                <br />
                <?php }?>
                <?php }?></td>
            </tr>
          </table>
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">
              <tr>
                <td><span style="font-weight:bold;color:#F00"><?php echo $entry_start_time_holiday; ?></span></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][start_time_holiday]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['start_time_holiday'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" id="product_description_<?php echo $language['language_id']; ?>_name" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_name_tour; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][name_tour]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name_tour'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_custom_title; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][custom_title]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['custom_title'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" cols="100" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="100" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_shortdescription; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][shortdescription]" class="editor" id="shortdescription<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['shortdescription'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][description]" class="editor" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>
              <?php }?>
              <tr>
                <td colspan="2" id="product-detail"><div class="vtabs-detail">
                    <?php $product_detail_row = 1; ?>
                    <?php foreach ($product_details as $result) { ?>
                    <a href="#tab-product-detail-<?php echo $product_detail_row; ?>" id="product-detail-<?php echo $product_detail_row; ?>"><?php echo $tab_product_detail . ' ' . $product_detail_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs-detail a:first').trigger('click'); $('#product-detail-<?php echo $product_detail_row; ?>').remove(); $('#tab-product-detail-<?php echo $product_detail_row; ?>').remove(); return false;" /></a>
                    <?php $product_detail_row++; ?>
                    <?php } ?>
                    <span id="product-detail-add"><?php echo $button_add_product_detail; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addProductDetail();" /></span>
                    <input type='hidden' id="slproduct_detail" />
                    </div>
                  <?php $product_detail_row = 1; ?>
                  <?php foreach ($product_details as $product_detail) { ?>
                  <div id="tab-product-detail-<?php echo $product_detail_row; ?>" class="vtabs-content">
                    <table class="form">
                      <tr>
                        <td><table width="100%">
                            <tr>
                              <td width="50%"><table width="100%">
                                  <tr>
                                    <td><label><?php echo $entry_label; ?></label></td>
                                    <td><input type="text" name="product_detail[<?php echo $product_detail_row; ?>][label]" value="<?php echo $product_detail['label']?>" size="50" /></td>
                                  </tr>
                                  <tr>
                                    <td><label><?php echo $entry_title; ?></label></td>
                                    <td><input type="text" name="product_detail[<?php echo $product_detail_row; ?>][title]" value="<?php echo $product_detail['title']?>" size="50" /></td>
                                  </tr>
                                  <tr>
                                    <td><label><?php echo $entry_status; ?></label></td>
                                    <td><select name="product_detail[<?php echo $product_detail_row; ?>][status]">
                                        <?php if ($product_detail['status']) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                      </select></td>
                                  </tr>
                                  <tr>
                                    <td><label><?php echo $entry_sort_order; ?></label></td>
                                    <td>
                                    <table width="100%">
                                    	<tr>
                                        	<td width="20%"><input type="text" name="product_detail[<?php echo $product_detail_row; ?>][sort_order]" value="<?php echo $product_detail['sort_order']?>" size="3" class="product_detail_sort_order_<?php echo $product_detail_row; ?>" /></td>
                                            <?php foreach($product_detail['meals'] as $meals){?>
                                            <td width="20%">
                                            <label><input type="checkbox" name="product_detail[<?php echo $product_detail_row; ?>][meal][]" value="<?php echo $meals['attribute_meal_id']?>" <?php echo $meals['checked']?>/> <?php echo $meals['name']?></label>
                                            </td>	
                                            <?php }?>
                                        </tr>
                                    </table>
                                    </td>
                                  </tr>
                                </table></td>
                              <td width="40%"><div class="image"><img src="<?php echo $product_detail['thumb']?>" alt="" id="product-detail-thumb<?php echo $product_detail_row; ?>" />
                                  <input type="hidden" name="product_detail[<?php echo $product_detail_row; ?>][image]" value="<?php echo $product_detail['image']?>" id="product-detail-image<?php echo $product_detail_row; ?>" />
                                  <br />
                                  <a onclick="image_upload('product-detail-image<?php echo $product_detail_row; ?>', 'product-detail-thumb<?php echo $product_detail_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#product-detail-thumb<?php echo $product_detail_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#product-detail-image<?php echo $product_detail_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr>
                        <td><textarea name="product_detail[<?php echo $product_detail_row; ?>][text]" id="product-detail-text-<?php echo $product_detail_row; ?>" class="editor editor1"><?php echo $product_detail['text']?></textarea></td>
                      </tr>
                      <tr>
                        <td><textarea name="product_detail[<?php echo $product_detail_row; ?>][menu]" id="product-detail-menu-<?php echo $product_detail_row; ?>" class="editor editor1"><?php echo $product_detail['menu']?></textarea></td>
                      </tr>
                    </table>
                  </div>
                  <?php $product_detail_row++; ?>
                  <?php } ?></td>
              </tr>
              <?php foreach ($languages as $language) { ?>
              <tr>
                <td><?php echo $entry_start_time; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][start_time]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['start_time'] : ''; ?>" /></td>
              </tr>
              
              <tr style="display:none">
                <td><span style="font-weight:bold;color:#F00"><?php echo $entry_start_time_tet; ?></span></td>
                <td>
                <input type="text" name="product_description[<?php echo $language['language_id']; ?>][start_time_tet]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['start_time_tet'] : ''; ?>" /> - <em>Ngày đầy đủ (ngày âm & ngày dương)</em>
                <br /><br />
                <input type="text" name="product_description[<?php echo $language['language_id']; ?>][start_time_tet_before]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['start_time_tet_before'] : ''; ?>" /> - <em>Ngày dương</em>
                <br /><br />
                <input type="text" name="product_description[<?php echo $language['language_id']; ?>][start_time_tet_after]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['start_time_tet_after'] : ''; ?>" /> - <em>Ngày âm</em>
                </td>
              </tr>
              <tr>
                <td><?php echo $entry_not_start_time; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][not_start_time]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['not_start_time'] : ''; ?>" /></td>
              </tr>
              <tr style="display:none;">
                <td><?php echo $entry_departure; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][departure]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['departure'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_location_from; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][location_from]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['location_from'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_location_to; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][location_to]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['location_to'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_transport; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][transport]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['transport'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_product_suggest; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][suggest]" class="editor"  id="suggest<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['suggest'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_highlights; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][highlights]" class="editor"  id="highlights<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['highlights'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_included; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][included]" class="editor"  id="included<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['included'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_notincluded; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][notincluded]" class="editor"  id="notincluded<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['notincluded'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_info; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][info]" class="editor"  id="info<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['info'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meeting; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meeting]" class="editor"  id="meeting<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meeting'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_terms; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][terms]" class="editor"  id="terms<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['terms'] : ''; ?></textarea></td>
              </tr>
              <tr style="display:none">
                <td><?php echo $entry_tag; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" size="80" /></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_robot_index; ?></td>
              <td><select name="robot_index">
                  <?php if ($robot_index) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_product_type; ?></td>
              <td><select name="product_type">
                    <?php if ($product_type == 0) { ?>
                    <option value="0" selected>Tour</option>
                    <?php } else { ?>
                    <option value="0">Tour</option>
                    <?php } ?>
                    
                    <?php if ($product_type == 1) { ?>
                    <option value="1" selected>Openbus</option>
                    <?php } else { ?>
                    <option value="1">Openbus</option>
                    <?php } ?>
                    
                    <?php if ($product_type == 2) { ?>
                    <option value="2" selected>Thuê xe</option>
                    <?php } else { ?>
                    <option value="2">Thuê xe</option>
                    <?php } ?>

                    <?php if ($product_type == 3) { ?>
                    <option value="3" selected>Chùm Tour Tết</option>
                    <?php } else { ?>
                    <option value="3">Chùm Tour Tết</option>
                    <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_product_class; ?></td>
              <td><select name="product_class">
                    <?php if ($product_class == 0) { ?>
                    <option value="0" selected>Tour Ghép</option>
                    <?php } else { ?>
                    <option value="0">Tour Ghép</option>
                    <?php } ?>
                    
                    <?php if ($product_class == 1) { ?>
                    <option value="1" selected>Tour Riêng</option>
                    <?php } else { ?>
                    <option value="1">Tour Riêng</option>
                    <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_model; ?></td>
              <td><input type="text" name="model" value="<?php echo $model; ?>" />
                <?php if ($error_model) { ?>
                <span class="error"><?php echo $error_model; ?></span>
                <?php } ?></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_sku; ?></td>
              <td><input type="text" name="sku" value="<?php echo $sku; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_upc; ?></td>
              <td><input type="text" name="upc" value="<?php echo $upc; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_ean; ?></td>
              <td><input type="text" name="ean" value="<?php echo $ean; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_jan; ?></td>
              <td><input type="text" name="jan" value="<?php echo $jan; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_isbn; ?></td>
              <td><input type="text" name="isbn" value="<?php echo $isbn; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_mpn; ?></td>
              <td><input type="text" name="mpn" value="<?php echo $mpn; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_location; ?></td>
              <td><input type="text" name="location" value="<?php echo $location; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_price; ?></td>
              <td><input type="text" name="price" value="<?php echo $price; ?>" />
                <label></label></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_tax_class; ?></td>
              <td><select name="tax_class_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($tax_classes as $tax_class) { ?>
                  <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_quantity; ?></td>
              <td><input type="text" name="quantity" value="<?php echo $quantity; ?>" size="2" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_minimum; ?></td>
              <td><input type="text" name="minimum" value="<?php echo $minimum; ?>" size="2" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_subtract; ?></td>
              <td><select name="subtract">
                  <?php if ($subtract) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_stock_status; ?></td>
              <td><select name="stock_status_id">
                  <?php foreach ($stock_statuses as $stock_status) { ?>
                  <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_shipping; ?></td>
              <td><?php if ($shipping) { ?>
                <input type="radio" name="shipping" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="shipping" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="shipping" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="shipping" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" size="100" id="seo_keyword" value="<?php echo $keyword; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_schedule; ?></td>
              <td><input type="text" name="schedule" size="100" value="<?php echo $schedule; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_duration; ?></td>
              <td><input type="text" name="duration" size="30" value="<?php echo $duration; ?>" /> <input type="text" name="sub_duration" size="50" value="<?php echo $sub_duration; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_location; ?></td>
              <td><input type="text" name="location" size="30" value="<?php echo $location; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_delay_book; ?></td>
              <td>
              <select name="delay_book">
              <?php for($i = 0; $i <= 10; $i++){?>
              <?php if($delay_book == $i){?>
              <option value="<?php echo $i; ?>" selected="selected"><?php echo $i; ?></option>
              <?php }else{?>
              <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
              <?php }?>
              <?php }?>
              </select>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_image; ?></td>
              <td><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_date_available; ?></td>
              <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" size="12" class="date" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_dimension; ?></td>
              <td><input type="text" name="length" value="<?php echo $length; ?>" size="4" />
                <input type="text" name="width" value="<?php echo $width; ?>" size="4" />
                <input type="text" name="height" value="<?php echo $height; ?>" size="4" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_length; ?></td>
              <td><select name="length_class_id">
                  <?php foreach ($length_classes as $length_class) { ?>
                  <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_weight; ?></td>
              <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_weight_class; ?></td>
              <td><select name="weight_class_id">
                  <?php foreach ($weight_classes as $weight_class) { ?>
                  <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
            </tr>
          </table>
        </div>
        <div id="tab-links">
          <table class="form">
            <tr style="display:none">
              <td><?php echo $entry_manufacturer; ?></td>
              <td><input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" />
                <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" /></td>
            </tr>
            
            <tr>
              <td><?php echo $entry_category; ?></td>
              <td>
              	<select name="category" size="0" class="category">
                	<option value="0"><?php echo $text_none; ?></option>
                    <?php foreach($categories as $item){?>
                    <option value="<?php echo $item['category_id']; ?>"><?php echo $item['name']; ?></option>
                    <?php }?>
                </select>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-category" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_categories as $product_category) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-category<?php echo $product_category['category_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_category['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_custom_breadcrumb; ?></td>
              <td>
              	<select name="custom_breadcrumb" size="0">
                	<option><?php echo $text_none; ?></option>
                    <?php foreach($categories as $item){?>
                    <?php if($item['category_id'] == $custom_breadcrumb){?>
                    <option value="<?php echo $item['category_id']; ?>" selected="selected"><?php echo $item['name']; ?></option>
                    <?php }else{?>
                    <option value="<?php echo $item['category_id']; ?>"><?php echo $item['name']; ?></option>
                    <?php }?>
                    <?php }?>
                </select>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_custom_link; ?></td>
              <td>
              	<select name="custom_link" size="0">
                	<option><?php echo $text_none; ?></option>
                    <?php foreach($categories as $item){?>
                    <?php if($item['category_id'] == $custom_link){?>
                    <option value="<?php echo $item['category_id']; ?>" selected="selected"><?php echo $item['name']; ?></option>
                    <?php }else{?>
                    <option value="<?php echo $item['category_id']; ?>"><?php echo $item['name']; ?></option>
                    <?php }?>
                    <?php }?>
                </select>
              </td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_filter; ?></td>
              <td><input type="text" name="filter" value="" /></td>
            </tr>
            <tr style="display:none">
              <td>&nbsp;</td>
              <td><div id="product-filter" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_filters as $product_filter) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-filter<?php echo $product_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_filter['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $product_store)) { ?>
                    <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="product_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $product_store)) { ?>
                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_download; ?></td>
              <td><input type="text" name="download" value="" /></td>
            </tr>
            <tr style="display:none">
              <td>&nbsp;</td>
              <td><div id="product-download" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_downloads as $product_download) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-download<?php echo $product_download['download_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_download['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_related; ?></td>
              <td><input type="text" name="related" value="" size="50"/></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-related" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_related as $product_related) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-related<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_related['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
          </table>
        </div>
        <div id="tab-attribute">
          <table id="attribute" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_attribute; ?></td>
                <td class="left">Type</td>
                <td class="left"><?php echo $entry_text; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $attribute_row = 0; ?>
            <?php foreach ($product_attributes as $product_attribute) { ?>
            <tbody id="attribute-row<?php echo $attribute_row; ?>">
              <tr>
                <td class="left"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" size="70"/>
                  <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                <td class="left"><select name="product_attribute[<?php echo $attribute_row; ?>][attribute_type]">
                    <?php foreach($attribute_types as $result){?>
                    <?php if($result['attribute_type_id'] == $product_attribute['attribute_type_id']){?>
                    <option value="<?php echo $result['attribute_type_id']?>" selected="selected"><?php echo $result['name']?></option>
                    <?php }else{?>
                    <option value="<?php echo $result['attribute_type_id']?>"><?php echo $result['name']?></option>
                    <?php }?>
                    <?php }?>
                  </select></td>
                <td class="left"><?php foreach ($languages as $language) { ?>
                  <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />
                  <?php } ?></td>
                <td class="left"><a onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $attribute_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="3"></td>
                <td class="left"><a onclick="addAttribute();" class="button"><?php echo $button_add_attribute; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-option">
          <div id="vtab-option" class="vtabs">
            <?php $option_row = 0; ?>
            <?php foreach ($product_options as $product_option) { ?>
            <a href="#tab-option-<?php echo $option_row; ?>" id="option-<?php echo $option_row; ?>"><i class="holiday<?php echo $product_option['category'];?>"></i><?php echo $product_option['name']; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('#option-<?php echo $option_row; ?>').remove(); $('#tab-option-<?php echo $option_row; ?>').remove(); $('#vtabs a:first').trigger('click'); return false;" /></a>
            <?php $option_row++; ?>
            <?php } ?>
            <span id="option-add">
            <input name="option" value="" style="width: 130px;" />
            &nbsp;<img src="view/image/add.png" alt="<?php echo $button_add_option; ?>" title="<?php echo $button_add_option; ?>" /></span></div>
          <?php $option_row = 0; ?>
          <?php $option_value_row = 0; ?>
          <?php foreach ($product_options as $product_option) { ?>
          <div id="tab-option-<?php echo $option_row; ?>" class="vtabs-content">
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
            <table class="form">
              <tr style="display:none">
                <td><?php echo $entry_required; ?></td>
                <td><select name="product_option[<?php echo $option_row; ?>][required]">
                    <?php if ($product_option['required']) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select></td>
              </tr>
              <?php if ($product_option['type'] == 'text') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'textarea') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><textarea name="product_option[<?php echo $option_row; ?>][option_value]" cols="40" rows="5"><?php echo $product_option['option_value']; ?></textarea></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'file') { ?>
              <tr style="display: none;">
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'date') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'datetime') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'time') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" /></td>
              </tr>
              <?php } ?>
            </table>
            <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
            <table id="option-value<?php echo $option_row; ?>" class="list">
              <thead>
                <tr>
                  <td class="left"><?php echo $entry_option_value; ?></td>
                  <td class="right" style="display:none"><?php echo $entry_quantity; ?></td>
                  <td class="left" style="display:none"><?php echo $entry_subtract; ?></td>
                  <td class="right"><?php echo $entry_price; ?></td>
                  <td class="right" style="display:none"><?php echo $entry_option_points; ?></td>
                  <td class="right" style="display:none"><?php echo $entry_weight; ?></td>
                  <td class="right"><?php echo $entry_included; ?></td>
                  <td></td>
                </tr>
              </thead>
              <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
              <tbody id="option-value-row<?php echo $option_value_row; ?>">
                <tr>
                  <td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">
                      <?php if (isset($option_values[$product_option['option_id']])) { ?>
                      <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                      <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                      <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
                    </select>
                    <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>
                  <td class="right" style="display:none"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" size="3" /></td>
                  <td class="left" style="display:none"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]">
                      <?php if ($product_option_value['subtract']) { ?>
                      <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                      <option value="0"><?php echo $text_no; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_yes; ?></option>
                      <option value="0" selected="selected"><?php echo $text_no; ?></option>
                      <?php } ?>
                    </select></td>
                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" style="display:none">
                      <?php if ($product_option_value['price_prefix'] == '+') { ?>
                      <option value="+" selected="selected">+</option>
                      <?php } else { ?>
                      <option value="+">+</option>
                      <?php } ?>
                      <?php if ($product_option_value['price_prefix'] == '-') { ?>
                      <option value="-" selected="selected">-</option>
                      <?php } else { ?>
                      <option value="-">-</option>
                      <?php } ?>
                    </select>
                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" size="10" /></td>
                  <td class="right" style="display:none"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">
                      <?php if ($product_option_value['points_prefix'] == '+') { ?>
                      <option value="+" selected="selected">+</option>
                      <?php } else { ?>
                      <option value="+">+</option>
                      <?php } ?>
                      <?php if ($product_option_value['points_prefix'] == '-') { ?>
                      <option value="-" selected="selected">-</option>
                      <?php } else { ?>
                      <option value="-">-</option>
                      <?php } ?>
                    </select>
                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" /></td>
                  <td class="right" style="display:none"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">
                      <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                      <option value="+" selected="selected">+</option>
                      <?php } else { ?>
                      <option value="+">+</option>
                      <?php } ?>
                      <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                      <option value="-" selected="selected">-</option>
                      <?php } else { ?>
                      <option value="-">-</option>
                      <?php } ?>
                    </select>
                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" /></td>
                  <td class="right">
                    <textarea style="width: 250px;height:50px" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][include]"><?php echo $product_option_value['include']; ?></textarea></td>
                  <td class="left"><a onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                </tr>
              </tbody>
              <?php $option_value_row++; ?>
              <?php } ?>
              <tfoot>
                <tr>
                  <td colspan="3"></td>
                  <td class="left"><a onclick="addOptionValue('<?php echo $option_row; ?>');" class="button"><?php echo $button_add_option_value; ?></a></td>
                </tr>
              </tfoot>
            </table>
            <select id="option-values<?php echo $option_row; ?>" style="display: none;">
              <?php if (isset($option_values[$product_option['option_id']])) { ?>
              <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
              <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php } ?>
          </div>
          <?php $option_row++; ?>
          <?php } ?>
        </div>
        <div id="tab-profile" style="display:none">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_profile ?></td>
                <td class="left"><?php echo $entry_customer_group ?></td>
                <td class="left"></td>
              </tr>
            </thead>
            <tbody>
              <?php $profileCount = 0; ?>
              <?php foreach ($product_profiles as $product_profile): ?>
              <?php $profileCount++ ?>
              <tr id="profile-row<?php echo $profileCount ?>">
                <td class="left"><select name="product_profiles[<?php echo $profileCount ?>][profile_id]">
                    <?php foreach ($profiles as $profile): ?>
                    <?php if ($profile['profile_id'] == $product_profile['profile_id']): ?>
                    <option value="<?php echo $profile['profile_id'] ?>" selected="selected"><?php echo $profile['name'] ?></option>
                    <?php else: ?>
                    <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
                    <?php endif; ?>
                    <?php endforeach; ?>
                  </select></td>
                <td class="left"><select name="product_profiles[<?php echo $profileCount ?>][customer_group_id]">
                    <?php foreach ($customer_groups as $customer_group): ?>
                    <?php if ($customer_group['customer_group_id'] == $product_profile['customer_group_id']): ?>
                    <option value="<?php echo $customer_group['customer_group_id'] ?>" selected="selected"><?php echo $customer_group['name'] ?></option>
                    <?php else: ?>
                    <option value="<?php echo $customer_group['customer_group_id'] ?>"><?php echo $customer_group['name'] ?></option>
                    <?php endif; ?>
                    <?php endforeach; ?>
                  </select></td>
                <td class="left"><a class="button" onclick="$('#profile-row<?php echo $profileCount ?>').remove()"><?php echo $button_remove ?></a></td>
              </tr>
              <?php endforeach; ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="2"></td>
                <td class="left"><a onclick="addProfile()" class="button"><?php echo $button_add_profile ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-discount" style="display:none">
          <table id="discount" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_quantity; ?></td>
                <td class="right"><?php echo $entry_priority; ?></td>
                <td class="right"><?php echo $entry_price; ?></td>
                <td class="left"><?php echo $entry_date_start; ?></td>
                <td class="left"><?php echo $entry_date_end; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $discount_row = 0; ?>
            <?php foreach ($product_discounts as $product_discount) { ?>
            <tbody id="discount-row<?php echo $discount_row; ?>">
              <tr>
                <td class="left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" /></td>
                <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" /></td>
                <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" /></td>
                <td class="left"><a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $discount_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="6"></td>
                <td class="left"><a onclick="addDiscount();" class="button"><?php echo $button_add_discount; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-special">
          <table id="special" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_priority; ?></td>
                <td class="right"><?php echo $entry_price; ?></td>
                <td class="left"><?php echo $entry_date_start; ?></td>
                <td class="left"><?php echo $entry_date_end; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $special_row = 0; ?>
            <?php foreach ($product_specials as $product_special) { ?>
            <tbody id="special-row<?php echo $special_row; ?>">
              <tr>
                <td class="left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>
                <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" /></td>
                <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" /></td>
                <td class="left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $special_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="5"></td>
                <td class="left"><a onclick="addSpecial();" class="button"><?php echo $button_add_special; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-image">
          <table id="images" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_image; ?></td>
                <td class="right"><?php echo $entry_sort_order; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $image_row = 0; ?>
            <?php foreach ($product_images as $product_image) { ?>
            <tbody id="image-row<?php echo $image_row; ?>">
              <tr>
                <td class="left"><div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
                    <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                    <br />
                    <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
                <td class="right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>
                <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $image_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="2"></td>
                <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-reward" style="display:none">
          <table class="form">
            <tr>
              <td><?php echo $entry_points; ?></td>
              <td><input type="text" name="points" value="<?php echo $points; ?>" /></td>
            </tr>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_reward; ?></td>
              </tr>
            </thead>
            <?php foreach ($customer_groups as $customer_group) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $customer_group['name']; ?></td>
                <td class="right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" /></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div>
        <div id="tab-design" style="display:none">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_store; ?></td>
                <td class="left"><?php echo $entry_layout; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $text_default; ?></td>
                <td class="left"><select name="product_layout[0][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php foreach ($stores as $store) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $store['name']; ?></td>
                <td class="left"><select name="product_layout[<?php echo $store['store_id']; ?>][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
$(function(){
	$( 'textarea.editor').each( function() {
		$(this).val($(this).val().replace(/[<]font [^>]*[>]/gi,""));
		$(this).val($(this).val().replace(/[<]li style="*"[^>]*[>]/gi,""));
		$(this).val($(this).val().replace(/[<]span style="*"[^>]*[>]/gi,""));
		$(this).val($(this).val().replace(/[<]br[^>]*[>]/gi,""));
	});
});
<?php foreach ($languages as $language) { ?>
$( 'textarea.editor').each( function() {
 CKEDITOR.replace( $(this).attr('id'),{
	 filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	
 });
});
<?php } ?>


//--></script> 
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.manufacturer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'manufacturer\']').attr('value', ui.item.label);
		$('input[name=\'manufacturer_id\']').attr('value', ui.item.value);
	
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

// Category
/*$('input[name=\'category\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-category' + ui.item.value).remove();
		
		$('#product-category').append('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category[]" value="' + ui.item.value + '" /></div>');

		$('#product-category div:odd').attr('class', 'odd');
		$('#product-category div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});*/
$('select[name=\'category\']').live('change',function(){
	var op = $('select[name=\'category\'] option:selected');
	$('#product-category' + op.val()).remove();
		
	$('#product-category').append('<div id="product-category' + op.val() + '">' + op.text() + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category[]" value="' + op.val() + '" /></div>');

	$('#product-category div:odd').attr('class', 'odd');
	$('#product-category div:even').attr('class', 'even');
	
	return false;
})
$('#product-category div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-category div:odd').attr('class', 'odd');
	$('#product-category div:even').attr('class', 'even');	
});

// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-filter' + ui.item.value).remove();
		
		$('#product-filter').append('<div id="product-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_filter[]" value="' + ui.item.value + '" /></div>');

		$('#product-filter div:odd').attr('class', 'odd');
		$('#product-filter div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-filter div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-filter div:odd').attr('class', 'odd');
	$('#product-filter div:even').attr('class', 'even');	
});

// Downloads
$('input[name=\'download\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.download_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-download' + ui.item.value).remove();
		
		$('#product-download').append('<div id="product-download' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_download[]" value="' + ui.item.value + '" /></div>');

		$('#product-download div:odd').attr('class', 'odd');
		$('#product-download div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-download div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-download div:odd').attr('class', 'odd');
	$('#product-download div:even').attr('class', 'even');	
});

// Related
$('input[name=\'related\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model+' : '+item.name,
						name : item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-related' + ui.item.value).remove();
		
		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.name + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');

		$('#product-related div:odd').attr('class', 'odd');
		$('#product-related div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-related div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-related div:odd').attr('class', 'odd');
	$('#product-related div:even').attr('class', 'even');	
});
//--></script> 
<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
	html  = '<tbody id="attribute-row' + attribute_row + '">';
    html += '  <tr>';
	html += '    <td class="left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" size="70" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '    <td class="left">';
	html += '    <select name="product_attribute[' + attribute_row + '][attribute_type]">';
		<?php foreach($attribute_types as $result){?>
	html += '    		<option value="<?php echo $result['attribute_type_id']?>"><?php echo $result['name']?></option>';
		<?php }?>
	html += '    </select>';
	html += '    </td>';
	html += '    <td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '<textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"></textarea><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />';
    <?php } ?>
	html += '    </td>';
	html += '    <td class="left"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
    html += '  </tr>';	
    html += '</tbody>';
	
	$('#attribute tfoot').before(html);
	
	attributeautocomplete(attribute_row);
	
	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').catcomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {	
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		}, 
		select: function(event, ui) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').attr('value', ui.item.label);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').attr('value', ui.item.value);
			
			return false;
		},
		focus: function(event, ui) {
      		return false;
   		}
	});
}

$('#attribute tbody').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script> 
<script type="text/javascript"><!--	
var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').catcomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item.category,
						cate: item.cate,
						label: item.name,
						value: item.option_id,
						type: item.type,
						option_value: item.option_value
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		html  = '<div id="tab-option-' + option_row + '" class="vtabs-content">';
		html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + ui.item.label + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + ui.item.value + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + ui.item.type + '" />';
		html += '	<table class="form">';
		html += '	  <tr style="display:none">';
		html += '		<td><?php echo $entry_required; ?></td>';
		html += '       <td><select name="product_option[' + option_row + '][required]">';
		html += '	      <option value="1"><?php echo $text_yes; ?></option>';
		html += '	      <option value="0" selected><?php echo $text_no; ?></option>';
		html += '	    </select></td>';
		html += '     </tr>';
		
		if (ui.item.type == 'text') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '     </tr>';
		}
		
		if (ui.item.type == 'textarea') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><textarea name="product_option[' + option_row + '][option_value]" cols="40" rows="5"></textarea></td>';
			html += '     </tr>';						
		}
		 
		if (ui.item.type == 'file') {
			html += '     <tr style="display: none;">';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '     </tr>';			
		}
						
		if (ui.item.type == 'date') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="date" /></td>';
			html += '     </tr>';			
		}
		
		if (ui.item.type == 'datetime') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="datetime" /></td>';
			html += '     </tr>';			
		}
		
		if (ui.item.type == 'time') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="time" /></td>';
			html += '     </tr>';			
		}
		
		html += '  </table>';
			
		if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {
			html += '  <table id="option-value' + option_row + '" class="list">';
			html += '  	 <thead>'; 
			html += '      <tr>';
			html += '        <td class="left"><?php echo $entry_option_value; ?></td>';
			html += '        <td class="right" style="display:none"><?php echo $entry_quantity; ?></td>';
			html += '        <td class="left" style="display:none"><?php echo $entry_subtract; ?></td>';
			html += '        <td class="right"><?php echo $entry_price; ?></td>';
			html += '        <td class="right" style="display:none"><?php echo $entry_option_points; ?></td>';
			html += '        <td class="right" style="display:none"><?php echo $entry_weight; ?></td>';
			html += '        <td class="right"><?php echo $entry_included; ?></td>';
			html += '        <td></td>';
			html += '      </tr>';
			html += '  	 </thead>';
			html += '    <tfoot>';
			html += '      <tr>';
			html += '        <td colspan="3"></td>';
			html += '        <td class="left"><a onclick="addOptionValue(' + option_row + ');" class="button"><?php echo $button_add_option_value; ?></a></td>';
			html += '      </tr>';
			html += '    </tfoot>';
			html += '  </table>';
            html += '  <select id="option-values' + option_row + '" style="display: none;">';
			
            for (i = 0; i < ui.item.option_value.length; i++) {
				html += '  <option value="' + ui.item.option_value[i]['option_value_id'] + '">' + ui.item.option_value[i]['name'] + '</option>';
            }

            html += '  </select>';			
			html += '</div>';	
		}
		
		$('#tab-option').append(html);
		
		$('#option-add').before('<a href="#tab-option-' + option_row + '" id="option-' + option_row + '"><i class="holiday' + ui.item.cate + '"></i>' + ui.item.label + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'#option-' + option_row + '\').remove(); $(\'#tab-option-' + option_row + '\').remove(); $(\'#vtab-option a:first\').trigger(\'click\'); return false;" /></a>');
		
		$('#vtab-option a').tabs();
		
		$('#option-' + option_row).trigger('click');		
		
		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});	
			
		$('.time').timepicker({timeFormat: 'h:m'});	
				
		option_row++;
		
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
//--></script> 
<script type="text/javascript"><!--		
var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue(option_row) {	
	html  = '<tbody id="option-value-row' + option_value_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]">';
	html += $('#option-values' + option_row).html();
	html += '    </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
	html += '    <td class="right" style="display:none"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" size="3" /></td>'; 
	html += '    <td class="left" style="display:none"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]">';
	html += '      <option value="0"><?php echo $text_no; ?></option>';
	html += '      <option value="1"><?php echo $text_yes; ?></option>';
	html += '    </select></td>';
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" style="display:none">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" size="10" /></td>';
	html += '    <td class="right" style="display:none"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';	
	html += '    <td class="right" style="display:none"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" size="5" /></td>';
	html += '    <td class="right">';
	html += '    <textarea name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][include]" style="width: 250px;height:50px"/></textarea></td>';
	html += '    <td class="left"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#option-value' + option_row + ' tfoot').before(html);

	option_value_row++;
}
//--></script> 
<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tbody id="discount-row' + discount_row + '">';
	html += '  <tr>'; 
    html += '    <td class="left"><select name="product_discount[' + discount_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" size="2" /></td>';
    html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';
    html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" class="date" /></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" class="date" /></td>';
	html += '    <td class="left"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';	
    html += '</tbody>';
	
	$('#discount tfoot').before(html);
		
	$('#discount-row' + discount_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	discount_row++;
}
//--></script> 
<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tbody id="special-row' + special_row + '">';
	html += '  <tr>'; 
    html += '    <td class="left"><select name="product_special[' + special_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
    html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_start]" value="" class="date" /></td>';
	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_end]" value="" class="date" /></td>';
	html += '    <td class="left"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
    html += '</tbody>';
	
	$('#special tfoot').before(html);
 
	$('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	special_row++;
}
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 960,
		height: 550,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
	html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
$('#vtab-option a').tabs();

var profileCount = <?php echo $profileCount ?>;

function addProfile() {
    profileCount++;
    
    var html = '';
    html += '<tr id="profile-row' + profileCount + '">';
    html += '  <td class="left">';
    html += '    <select name="product_profiles[' + profileCount + '][profile_id]">';
    <?php foreach ($profiles as $profile): ?>
    html += '      <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>';
    <?php endforeach; ?>
    html += '    </select>';
    html += '  </td>';
    html += '  <td class="left">';
    html += '    <select name="product_profiles[' + profileCount + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group): ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id'] ?>"><?php echo $customer_group['name'] ?></option>';
    <?php endforeach; ?>
    html += '    <select>';
    html += '  </td>';
    html += '  <td class="left">';
    html += '    <a class="button" onclick="$(\'#profile-row' + profileCount + '\').remove()"><?php echo $button_remove ?></a>';
    html += '  </td>';
    html += '</tr>';
    
    $('#tab-profile table tbody').append(html);
}

//--></script> 
<script>
$('input[name=price]').keyup(function(){
	var val = $(this).val();
	$(this).next().text(showNumber(val));
});
</script> 
<script type="text/javascript"><!--
var product_detail_row = <?php echo $product_detail_row; ?>;
$('#slproduct_detail').attr('value',product_detail_row);
function addProductDetail() {	
	var sort_order_max = $('.product_detail_sort_order_'+(product_detail_row-1)).val();
	
	if(sort_order_max){
		sort_order_max = parseInt(sort_order_max) + 1;
	}else{
		sort_order_max = 1;
	}
	
	html  = '<div id="tab-product-detail-' + product_detail_row + '" class="vtabs-content">';
	html += '  <table class="form">';
	html += '    <tr>';
	html += '    <td>';
	html += '    <table width="100%">';
	html += '    <tr>';
	html += '    	<td width="50%">';
	html += '    		<table>';
	html += '    			<tr>';
	html += '    				<td><?php echo $entry_label; ?></td>';
	html += '    				<td><input type="text" name="product_detail[' + product_detail_row + '][label]" value="" size="50" /></td>';
	html += '    			</tr>';
	html += '    			<tr>';
	html += '    				<td><?php echo $entry_title; ?></td>';
	html += '    				<td><input type="text" name="product_detail[' + product_detail_row + '][title]" value="" size="50" /></td>';
	html += '    			</tr>';
	html += '    			<tr>';
	html += '    				<td><?php echo $entry_status; ?></td>';
	html += '    				<td>';
	html += '    					<select name="product_detail[' + product_detail_row + '][status]">';
	html += '    						<option value="1"><?php echo $text_enabled; ?></option>';
	html += '    						<option value="0"><?php echo $text_disabled; ?></option>';
	html += '    					</select>';
	html += '    				</td>';
	html += '    			</tr>';
	html += '    			<tr>';
	html += '    				<td><?php echo $entry_sort_order; ?></td>';
	html += '    				<td>';
	html += '    					<table width="100%">';
	html += '    						<tr>';
	html += '    							<td>';
	html += '    							<input type="text" name="product_detail[' + product_detail_row + '][sort_order]" value="'+sort_order_max+'" size="3" class="product_detail_sort_order_' + product_detail_row + '"/>';
	html += '    							</td>';
											<?php foreach($attribute_meals as $attribute_meal){?>
	html += '    							<td>';
	html += '    							<label><input type="checkbox" name="product_detail[' + product_detail_row + '][meal][]" value="<?php echo $attribute_meal['attribute_meal_id']?>"/> <?php echo $attribute_meal['name']?></label>';
	html += '    							</td>';
											<?php }?>
	html += '    						</tr>';
	html += '    					</table>';
	html += '    				</td>';
	html += '    			</tr>';
	html += '    		</table>';
	html += '    	</td>';
	html += '    <td>';
	html += '    	<div class="image"><img src="<?php echo $no_image; ?>" alt="" id="product-detail-thumb' + product_detail_row + '" /><input type="hidden" name="product_detail[' + product_detail_row + '][image]" value="" id="product-detail-image' + product_detail_row + '" /><br /><a onclick="image_upload(\'product-detail-image' + product_detail_row + '\', \'product-detail-thumb' + product_detail_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#product-detail-thumb' + product_detail_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#product-detail-image' + product_detail_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div>';
	html += '    </td>';
	html += '    </tr>';
	html += '    </table>';
	html += '    </td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '       <td><textarea name="product_detail[' + product_detail_row + '][text]" id="product-detail-text-' + product_detail_row + '" class="editor"></textarea></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '       <td><textarea name="product_detail[' + product_detail_row + '][menu]" id="product-detail-menu-' + product_detail_row + '" class="editor"></textarea></td>';
	html += '    </tr>';
	html += '  </table>'; 
	html += '</div>';
	
	$('#product-detail').append(html);
	$('#slproduct_detail').attr('value',product_detail_row);
	CKEDITOR.replace('product-detail-text-' + product_detail_row + '', {
		filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	}); 
	CKEDITOR.replace('product-detail-menu-' + product_detail_row + '', {
		filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	}); 
	
	$('#product-detail-add').before('<a href="#tab-product-detail-' + product_detail_row + '" id="product-detail-' + product_detail_row + '"><?php echo $tab_product_detail; ?> ' + product_detail_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs-detail a:first\').trigger(\'click\'); $(\'#product-detail-' + product_detail_row + '\').remove(); $(\'#tab-product-detail-' + product_detail_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs-detail a').tabs();
	
	$('#product-detail-' + product_detail_row).trigger('click');
	
	product_detail_row++;
   $.ajax({
      url : "index.php?route=catalog/product/sldetail&token=<?php echo $token; ?>&sl="+$('#slproduct_detail').val(),
      type : "get",
      success : function (result){
          // Sau khi gửi và kết quả trả về thành công thì gán nội dung trả về
          // đó vào thẻ div có id = result
          $('#rltdetail').html(result);
      }
  });
}
//--></script> 
<div id="rltdetail">
  <?php
    if($product_detail_row > 1) {
      $html = '<script type="text/javascript">window.onbeforeunload = function (example) {
      example = example || window.event;';
      for ($i=1; $i < $product_detail_row; $i++) {
        $html .= 'var value'.$i.' =  CKEDITOR.instances["product-detail-text-'.$i.'"].getData();';
      }
      $html .= 'if(value1 != ""';
      for ($i=2; $i < $product_detail_row; $i++) {
      $html .= ' | value'.$i.' != ""'; 
    }
      $html .= ') {if (example) {example.returnValue = "Are you sure you want to close the Tab?";}// For Safari
      return "Are you sure you want to close the Tab?";}};</script>';
      echo $html;
    }
 ?>
</div>
<script type="text/javascript"><!--
$('.vtabs-detail a').tabs();
//--></script>
<?php if(!$id){?>
<script type="text/javascript" src="view/javascript/jquery/jquery.slug.js"></script> 
<script>
$("#seo_keyword").slug({
	source: "#product_description_2_name",
	replacement: "-"
});
</script>
<?php }?>
<?php echo $footer; ?>