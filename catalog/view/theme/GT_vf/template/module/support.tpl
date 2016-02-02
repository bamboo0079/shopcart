<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content box-support-list">
    <ul>
      <?php foreach($support_online as $item){?>
      <li>
        <div class="name">
          <label> <i class="fa fa-user"></i> <?php echo $item['name']?></label>
          <span> <i class="fa fa-phone"></i> <?php echo $item['phone']?></span></div>
        <div class="yahoo"> <a href="ymsgr:addfriend?<?php echo $item['yahoo']?>"><img src='http://opi.yahoo.com/online?u=<?php echo $item['yahoo']?>&m=g&t=1'/></a> <a href="Skype:<?php echo $item['skype']?>?chat"> <img src="http://mystatus.skype.com/smallclassic/<?php echo $item['skype']?>"> </a> </div>
      </li>
      <?php }?>
    </ul>
  </div>
</div>
