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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="right"><?php echo $column_code; ?></td>
              <td class="right"><?php echo $column_total; ?></td>
              <td class="right"><?php echo $column_success; ?></td>
              <td class="right"><?php echo $column_fail; ?></td>
              <td class="right"><?php echo $date; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($mail_templates) { ?>
            <?php foreach ($mail_templates as $mail_template) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($mail_template['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $mail_template['mail_template_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $mail_template['mail_template_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $mail_template['name']; ?></td>
              <td class="right"><?php echo $mail_template['code']; ?></td>
              <td class="right"><?php echo $mail_template['total']; ?></td>
              <td class="right"><a href="<?php echo $mail_template['viewViews']; ?>" target="_blank"><?php echo $mail_template['success']; ?></td>
              <td class="right"><?php echo $mail_template['error']; ?></a></td>
              <td class="right"><?php echo $mail_template['date_added']; ?></td>
              <td class="right"><?php foreach ($mail_template['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
           
      <div class="pagination"><?php echo $pagination; ?></div>
      <script src="http://code.highcharts.com/highcharts.js"></script>
     <script src="http://code.highcharts.com/modules/exporting.js"></script>
        <div id="container_chart" style=" max-width: <?php echo $total_chart."50px" ?>; height: 400px; margin: 0 auto"></div>
    </div>
  </div>
</div>
        
<script type="text/javascript">
  
    $(function () {
      $('#container_chart').highcharts({

          chart: {
              type: 'column'
          },

          title: {
              text: 'Bảng thống kê tổng số mail được tính trên đơn vị %'
          },

          xAxis: {
              categories: [<?php if ($mail_templates) { ?>
                <?php foreach ($mail_templates as $mail_template) { 
                  echo "'".$mail_template['name']."',";}
              }?>]
          },

          yAxis: {
              allowDecimals: false,
              min: 0,
              title: {
                  text: 'Tổng số mail đã có 100%'
              }
          },

          tooltip: {
              formatter: function () {
                  return '<b>' + this.x + '</b><br/>' +
                      this.series.name + ': ' + this.y + '<br/>' +
                      'Total: ' + this.point.stackTotal;
              }
          },

          plotOptions: {
              column: {
                  stacking: 'normal'
              }
          },

          series: [{
              name: 'Thành công',
              data: [<?php if ($mail_templates) { ?>
                      <?php foreach ($mail_templates as $mail_template) {
                              if (!empty($mail_template['success']) && $mail_template['total']){
                                  $success= round(($mail_template['success'] * 100)/$mail_template['total']);
                              }else{
                                $success= 0;
                              }
                              echo $success.",";
                            }
                      }?>
              ],
              stack: 'male'
          }, {
              name: 'Thất bại',
              data: [
              <?php if ($mail_templates) { ?>
                      <?php 
                      foreach ($mail_templates as $mail_template) { 
                           if (!empty($mail_template['error']) && $mail_template['total']){
                                  $error= round(($mail_template['error'] * 100)/$mail_template['total']);
                              }else{
                                $error= 0;
                              }
                              echo $error.",";
                            }
              }?>
              ],
              stack: 'male'
          }]
      });
  });
</script>
<?php echo $footer; ?>