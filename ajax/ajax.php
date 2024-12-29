<?php
if (file_exists(__DIR__ . "/../autoload.php")) {
  require_once __DIR__ . "/../autoload.php";
}

if (isset($_GET["action"])) {
  $action = $_GET["action"];
}


switch ($action) {
  case "add_post";
    $post_aut_name = $_POST["aut_name"];
    $post_content = $_POST["post_content"];
    $user_photo = move($_FILES["aut_img"], "../media/user_photo/");
    $post_photo = [];
    if (!empty($_FILES["post_img"]["name"][0])) {
      for ($i = 0; $i < count($_FILES["post_img"]["name"]); $i++) {
        $post_photo_itam =  move([
          "tmp_name" => $_FILES["post_img"]["tmp_name"][$i],
          "name" => $_FILES["post_img"]["name"][$i],
        ], "../media/post_photos/");
        array_push($post_photo, $post_photo_itam);
      }
    }
    $post_photo_encode = json_encode($post_photo);
    $post_video = null;
    if ($_FILES["post_video"]["name"]) {
      $post_video = move(
        [
          "tmp_name"  => $_FILES["post_video"]["tmp_name"],
          "name"      => $_FILES["post_video"]["name"]
        ],
        "../media/video/"
      );
    }

    // new post update
    $sql = "INSERT INTO posts(user_name,user_photo,post_content,post_photo,post_video) VALUES(?,?,?,?,?)";
    $statement = connection()->prepare($sql);
    $statement->execute([$post_aut_name, $user_photo, $post_content, $post_photo_encode, $post_video]);
    break;
  case "get_all_posts";
    // $sql = "SELECT posts.id,posts.user_name,posts.user_photo,posts.post_content,posts.post_photo,posts.post_video,posts.likes,posts.Share,posts.createdAt,comments.id as comme_id,comments.post_id,comments.comm_user_name,comments.comm_user_img,comments.comment_photo,comments.comment_content,comments.createdAt as commet_createdAt FROM posts LEFT JOIN comments ON posts.id = comments.post_id";
    $sql = "SELECT * FROM posts";
    $statement = connection()->prepare($sql);
    $statement->execute();
    $posts = $statement->fetchAll(PDO::FETCH_OBJ);
    echo json_encode($posts);
    break;

  case "like_post";
    $likeId = $_POST["like_id"];
    $sql = "UPDATE posts SET likes = likes + 1 WHERE id = ?";
    $statement = connection()->prepare($sql);
    $statement->execute([$likeId]);
    break;

  case "add_comment";
    $commetn_post_id = $_POST["comment_id"];
    $comment_aut_name = $_POST["comment_aut_name"];
    $comment_content = $_POST["comment_content"];


    $comment_aut_photo = move([
      "tmp_name" => $_FILES["comment_aut_img"]["tmp_name"],
      "name"   => $_FILES["comment_aut_img"]["name"],
    ], "../media/user_photo/");

    $comment_photo = null;
    if ($_FILES["comment_img"]["name"]) {
      $comment_photo = move([
        "tmp_name" => $_FILES["comment_img"]["tmp_name"],
        "name"   => $_FILES["comment_img"]["name"],
      ], "../media/comment_photo/");
    }

    $sql = "INSERT INTO comments(post_id,comm_user_name,comm_user_img,comment_photo,comment_content) VALUES(?,?,?,?,?)";
    $statement = connection()->prepare($sql);
    $statement->execute([$commetn_post_id, $comment_aut_name, $comment_aut_photo, $comment_photo, $comment_content]);
    break;

  case "get_comments";
    $sql = "SELECT * FROM comments";
    $statement = connection()->prepare($sql);
    $statement->execute();
    $comments = $statement->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($comments);
    break;
}
