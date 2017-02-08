<?php
namespace Api\Controller;

use Common\Controller\HomeBaseController;

class ArticleController extends HomeBaseController
{

    public function getArticle()
    {
        $cid = I('get.cid', 0, 'intval');
        // 获取分类数据
        $category = D('Category')->getDataByCid($cid);
        // 如果分类不存在；则返回404页面
        if (empty($category)) {
            $data = array(
                'code'     => 500,
                'category' => '',
                'articles' => '',
                'page'     => '',
                'cid'      => $cid
            );

            exit(json_encode($data));
        }
        // 获取分类下的文章数据
        $articles = D('Article')->getPageData($cid);
        $data = array(
            'code'     => 200,
            'category' => $category,
            'articles' => $articles['data'],
            'page'     => $articles['page'],
            'cid'      => $cid
        );

        exit(json_encode($data));
    }



}
