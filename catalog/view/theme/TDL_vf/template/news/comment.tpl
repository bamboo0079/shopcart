<?php if ($comments) { ?>
<?php foreach ($comments as $comment) { ?>
<section class="content">
  <header><strong><?php echo $comment['author']; ?></strong> <span>(<?php echo $comment['date_added']; ?>)</span></header>
  <article><?php echo $comment['text']; ?></article>
</section>
<?php } ?>
<?php } else { ?>
<div class="content"><?php echo $text_no_comment; ?></div>
<?php } ?>
