<?php echo $header; ?>

<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if (isset($error) && !empty($error)) { ?>
    <div class="warning"><?php echo $error; ?></div>
    <?php } ?>
    <?php if (isset($success)&& !empty($success)) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /><?php echo $heading_title?></h1>
            <div class="buttons"><a href="<?php echo($link_add ? $link_add : '');?>" class="button"><?php echo $button_add; ?></a><a class="button delete"><?php echo $button_delete; ?></a></div>
        </div>
        <div class="content">
            <?php
                if(!empty($event_list)){
            ?>
            <form action="<?php echo $action_form;?>" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                    <tr>
                        <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"></td>
                        <td class="left">
                            <?php echo $event_name;?>
                        </td>
                        <td class="left">
                            <?php echo $event_code;?>
                        </td>
                        <td class="left">
                            <?php echo $status;?>
                        </td>
                        <td class="right"><?php echo $action;?></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        foreach($event_list as $items){
                    ?>
                    <tr>
                        <td style="text-align: center;">
                            <input type="checkbox" name="selected[]" value="<?php echo $items['id'];?>">
                        </td>
                        <td class="left"><?php echo $items['event_name'];?></td>
                        <td class="left"><?php echo $items['event_code'];?></td>
                        <td class="left"><?php echo ($items['status'] == 1 ? 'Enable' : 'Disable');?></td>
                        <td class="right" width="15%">
                            [ <a href="<?php echo $this->url->link('module/event/edit_event&id='.$items['id'],'token='.$this->session->data['token'],'SSL');?>"><?php echo $event_edit;?></a> ]
                            [ <a onclick="return confirm('Are you sure you want to delete this item?');" href="<?php echo $this->url->link('module/event/delete_items&id='.$items['id'],'token='.$this->session->data['token'],'SSL');?>"><?php echo $button_delete;?></a> ]
                        </td>
                    </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </form>
            <?php }else{ echo "Chưa có sự kiện trong danh sách !"; } ?>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $('.delete').on('click',function(){
            var x = confirm("Are you sure you want to delete?");
            if (x)
                $('form').submit();
            else
                return false;
        })

    })
</script>
<?php echo $footer; ?>