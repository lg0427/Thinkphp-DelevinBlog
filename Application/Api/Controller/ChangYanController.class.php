<?php

namespace Api\Controller;


class ChangYanController extends \Think\Controller
{


    public function commentCallback()
    {
        if (IS_POST) {

            $data = I('post.data', '', 'trim');

            \Think\Log::write("============回调=====" . $data, 'ERR');
            $data = json_decode($data, true);

            D('OauthUser')->startTrans();
            if (!empty($data)) {
                print_r($data['comments']);
                foreach ($data['comments'] as $val) {
                    $user = $val['user'];
                    print_r($val);
                    if (!empty($user)) {
                        $user_id = D('OauthUser')->where(['cy_userid' => $user['sohuPlusId']])->getField('id');
                        if (empty($user_id)) {
                            $addUser = [
                                'cy_userid'     => $user['sohuPlusId'],
                                'nickname'      => $user['nickname'],
                                'head_img'      => $user['usericon'],
                                'openid'        => 'CHANGYAN',
                                'access_token'  => 'CHANGYAN',
                                'create_time'   => time(),
                                'email'         => 'CHANGYAN',
                                'last_login_ip' => $val['ip'],
                            ];
                            $user_id = D('OauthUser')->add($addUser);
                        }

                        if (empty($user_id)) return false;
                        $pid = 0;
                        if ($val['replyid'] > 0) {
                            $pid = D('Comment')->where(['cy_replyid' => $val['replyid']])->getField('cmtid');

                        }
                        $commentData = [
                            'ouid'       => $user_id,
                            'type'       => 1,
                            'pid'        => $pid > 0 ? intval($pid) : 0,
                            'cy_replyid' => $val['cmtid'],
                            'aid'        => $data['sourceid'],
                            'content'    => $val['content'],
                            'date'       => strtotime($val['ctime']),
                        ];
                        $addId = D('Comment')->add($commentData);
                        if ($addId > 0) {
                            D('OauthUser')->commit();
                            echo '添加成功';

                            return true;
                        }

                    }

                }


            }

            D('OauthUser')->rollback();
            echo '添加失败';


        }
        return false;
    }
}
