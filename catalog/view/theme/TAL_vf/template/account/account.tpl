<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php 
if (isset($column_left)) {
  echo $column_left; 
}
if(isset($column_right)){
  echo $column_right; 
}
?>
<div id="content" class="content-block">
    <?php echo $content_top; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <h2 class="h2-line"><?php echo $text_my_account; ?></h2>
    <div class="content-left">
        <ul class="account_list">
            <li <?php echo (isset($active) && $active == 'account' ? 'id="active"' : '');?> ><a href="<?php echo $edit; ?>"><i class="fa fa-info-circle"></i> <?php echo $text_edit; ?></a></li>
            <li <?php echo (isset($active) && $active == 'password' ? 'id="active"' : '');?> ><a href="<?php echo $password; ?>"><i class="fa fa-eye-slash"></i> <?php echo $text_password; ?></a></li>
            <li <?php echo (isset($active) && $active == 'order' ? 'id="active"' : '');?> ><a href="<?php echo $order; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $text_order; ?></a></li>
            <li <?php echo (isset($active) && $active == 'newsletter' ? 'id="active"' : '');?>><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o"></i> <?php echo $text_newsletter; ?></a></li>
        </ul>
    </div>
    <div class="content-right">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="content">
                <table class="form">
                    <tr>
                        <td class="td-left"><span class="required">*</span> <?php echo $entry_lastname; ?></td>
                        <td  class="td-right"><input type="text" name="lastname" value="<?php echo $lastname; ?>" size="30" placeholder="<?php echo $text_placeholder_lastname; ?>" data-validation="required" data-validation-error-msg="<?php echo $lang_error_lastname; ?>" autocomplete="off"/>
                            <?php if ($error_lastname) { ?>
                            <span class="error"><?php echo $error_lastname; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
                        <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" size="30" placeholder="<?php echo $text_placeholder_firstname; ?>" data-validation="required" data-validation-error-msg="<?php echo $lang_error_firstname; ?>" autocomplete="off"/>
                            <?php if ($error_firstname) { ?>
                            <span class="error"><?php echo $error_firstname; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_birthday; ?></td>
                        <td>
                            <select name="birthday_day" data-validation="required" data-validation-error-msg="<?php echo $lang_error_birthday_day; ?>">
                                <option value=""><?php echo $text_day?></option>
                                <?php for($i = 1;$i < 32;$i++){?>
                                <?php if($i == $birthday_day){?>
                                <option value="<?php echo $i?>" selected="selected"><?php echo $i?></option>
                                <?php }else{?>
                                <option value="<?php echo $i?>"><?php echo $i?></option>
                                <?php }?>
                                <?php }?>
                            </select>
                            <select name="birthday_month" data-validation="required" data-validation-error-msg="<?php echo $lang_error_birthday_month; ?>">
                                <option value=""><?php echo $text_month?></option>
                                <?php for($i = 1;$i < 13;$i++){?>
                                <?php if($i == $birthday_month){?>
                                <option value="<?php echo $i?>" selected="selected"><?php echo $i?></option>
                                <?php }else{?>
                                <option value="<?php echo $i?>"><?php echo $i?></option>
                                <?php }?>
                                <?php }?>
                            </select>
                            <select name="birthday_year" data-validation="required" data-validation-error-msg="<?php echo $lang_error_birthday_year; ?>">
                                <option value=""><?php echo $text_year?></option>
                                <?php for($i = date("Y") - 10;$i > date("Y") - 100;$i--){?>
                                <?php if($i == $birthday_year){?>
                                <option value="<?php echo $i?>" selected="selected"><?php echo $i?></option>
                                <?php }else{?>
                                <option value="<?php echo $i?>"><?php echo $i?></option>
                                <?php }?>
                                <?php }?>
                            </select>
                            <?php if ($error_birthday) { ?>
                            <span class="error"><?php echo $error_birthday; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_email; ?></td>
                        <td><input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $text_placeholder_email; ?>" size="30" data-validation="email" data-validation-error-msg="<?php echo $lang_error_email; ?>" autocomplete="off"/>
                            <input type="hidden" name="old_email" value="<?php echo $email; ?>">
                            <?php if ($error_email) { ?>
                            <span class="error"><?php echo $error_email; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
                        <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $text_placeholder_telephone; ?>" size="30" maxlength="11" data-validation="length" data-validation-length="10-11" data-validation-error-msg="<?php echo $lang_error_telephone; ?>" autocomplete="off"/>
                            <?php if ($error_telephone) { ?>
                            <span class="error"><?php echo $error_telephone; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_fax; ?></td>
                        <td><input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $text_placeholder_fax; ?>" size="30"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <span class="span-button">
                                <input type="submit" value="<?php echo $entry_update; ?>" class="button" />
                            </span>
                        </td>
                    </tr>
                </table>
            </div>

        </form>


    </div>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>