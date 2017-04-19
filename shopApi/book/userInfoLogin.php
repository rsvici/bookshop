<?php
	sleep(2);
    // AngularJS中的跨域 需要添加下面2个header头
    header("Access-Control-Allow-Origin:*");
    // 告诉POST请求可以获取请求的类型
    header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type, Accept');

    //var_dump($_POST);
    //echo json_encode($_POST);
    //验证密码
    if(isset($_POST['username']) && 
        isset($_POST['password'])){
        require "./extends/config.php";
        require "./extends/Model.class.php";
        $userModel = new Model('b_user');
        $username = $_POST['username'];
        $selectResult = $userModel->where("user_name='$username'")->select();
        if($selectResult){
            // 验证密码
            // 注册过程  就告诉你用户名是否注册
            if($_POST['password'] == $selectResult[0]['user_password']){
                unset($selectResult[0]['user_password']);
                $result['code'] = 0;
                $result['data'] = $selectResult[0];
                echo json_encode($result);
            }else {
                $result['code'] = 2;
                $result['data'] = "用户名或密码错误";
                echo json_encode($result);
            }
        }else {
            $result['code'] = 1;
            $result['data'] = "用户名不存在";
            echo json_encode($result);
        }
    }else {
        $result['code'] = 3;
        $result['data'] = "no post params";
        echo json_encode($result);
    }



