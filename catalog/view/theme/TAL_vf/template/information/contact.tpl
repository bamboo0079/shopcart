<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <div class="ct-left">
    <h1 class="h1-head">Thông tin liên hệ Viet Fun Travel</h1>
    <div class="ct-line"><img src="<?php echo $line; ?>"></div>
    <table>
      <tr>
        <td colspan="2" class="td-left"><span class="cp-title">CÔNG TY TNHH VIET VUI - VIET FUN TRAVEL</span></td>
      </tr>
      <tr>
        <td class="td-left">Địa chỉ:</td>
        <td>28/13 Bùi Viện, P.Phạm Ngũ Lão, Q.1, Tp.HCM, Việt Nam</td>
      </tr>
      <tr>
        <td class="td-left">Điện thoại:</td>
        <td>+84 (0) 903 550 236 | +84 (0) 0903 779 759</td>
      </tr>
      <tr>
        <td class="td-left">Fax:</td>
        <td>+84 (08) 3920 6900</td>
      </tr>
      <tr>
        <td class="td-left">Email:</td>
        <td><a href="mailto:sales@vietfuntravel.com.vn">sales@vietfuntravel.com.vn</a></td>
      </tr>
      <tr>
        <td class="td-left">Website:</td>
        <td><a href="http://www.vietfuntravel.com.vn">www.vietfuntravel.com.vn</a></td>
      </tr>
      <tr>
        <td colspan="2"><strong style="font-size: 15px;">Tổng đài tư vấn & đặt dịch vụ:</strong> <strong style="color: red; font-size: 15px;">1900 6749</strong><span style="font-size: 15px"> &nbsp;| &nbsp;</span><strong style="color: red; font-size: 15px;">08 7300 6749</strong></td>
      </tr>
    </table>
    <h1 class="h1-footer">Thông tin liên hệ Viet Fun Travel</h1>
    <div class="ct-line"><img src="<?php echo $line; ?>"></div>
    <table class="icon-lg">
      <tr>
        <td><a href="https://www.facebook.com/dulichvietvui" target="_blank"><img src="<?php echo $face_icon;?>"></a></td>
        <td><a href="https://plus.google.com/+VietfuntravelVn/about" target="_blank"><img src="<?php echo $google_icon;?>"></a></td>
        <td><img src="<?php echo $pr_icon;?>"></td>
        <td><img src="<?php echo $tt_icon;?>"></td>
      </tr>
    </table>
  </div>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="ct-right">
    <h1>Gửi thư cho Viet Fun Travel</h1>
    <div class="ct-line"><img src="<?php echo $line; ?>"></div>
    <table>
      <tr>
        <td width="20%">Họ và tên <span>*</span></td>
        <td colspan="2"><input type="text" name="name" value="" style="width: 97%;"></td>
      </tr>
      <tr>
        <td>Email <span>*</span></td>
        <td colspan="2"><input type="text" name="email" value="" style="width: 97%;"></td>
      </tr>
      <tr>
        <td>Nội dung <span>*</span></td>
        <td colspan="2"><textarea name="enquiry" cols="40" rows="10" style="width: 97%;"></textarea></td>
      </tr>
      <tr>
        <td class="td-img">Mã bảo vệ <span>*</span></td>
        <td class="td-img"><input type="text" name="captcha" value="" style="width: 93%;"></td>
        <td class="td-img"><img src="index.php?route=information/contact/captcha" alt="" /></td>
      </tr>
      <tr>
        <td></td>
        <td colspan="2" style="padding-top: 2px;"><input type="submit" value="Gởi thư" class="button"></td>
      </tr>
    </table>
  </div>
  </form>
  <div class="content ct-map" style="width: 100%">
    <iframe width="100%" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Viet+Fun+Travel,+ph%C6%B0%E1%BB%9Dng+Ph%E1%BA%A1m+Ng%C5%A9+L%C3%A3o,+Ho+Chi+Minh+City,+Vietnam&amp;aq=0&amp;oq=vietfuntravel&amp;sll=37.0625,-95.677068&amp;sspn=38.963048,86.572266&amp;ie=UTF8&amp;hq=Viet+Fun+Travel,&amp;hnear=ph%C6%B0%E1%BB%9Dng+Ph%E1%BA%A1m+Ng%C5%A9+L%C3%A3o,+Qu%E1%BA%ADn+1,+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam&amp;ll=10.768229,106.694361&amp;spn=0.011826,0.021136&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=1028095815559464759&amp;output=embed"></iframe>
  </div>
</div>

<?php echo $footer; ?>