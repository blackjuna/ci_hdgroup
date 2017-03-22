<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sales_Model extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
		
	}

	function get_e_swg_size($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "e_swg_size as t1";
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_e_swg_class($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "e_swg_class as t1";
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_e_swg_series($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "e_swg_series as t1";
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_e_pl_swg_dimension($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "e_pl_swg_dimension as t1";
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_e_pl_swg_config($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "e_pl_swg_config as t1";
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_m_pricelist($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "m_pricelist as t1";
		$params['where']['t1.is_deleted'] 	= '0';
		$params['ob']	= 't2.validfrom desc';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_m_pricelist_version($params)
	{
		$params['select']	= !key_exists('select', $params) ? "t1.*, t2.name ||'_'|| t1.name as name_version" : $params['select'];
		$params['table'] 	= "m_pricelist_version as t1";
		$params['join'][] = ['m_pricelist as t2', 't1.pricelist_id = t2.id', 'left'];
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
	function get_m_pricelist_item($params)
	{
		$params['select']	= "t1.*, t1.code ||'_'|| t1.name as code_name, t3.code ||'_'|| t3.name as code_name_pricelist, t4.code ||'_'|| t4.name as code_name_pricelist_version";
		$params['select']	= !key_exists('select', $params) ? "t1.*" : $params['select'];
		$params['table'] 	= "m_pricelist_item as t1";
		$params['join'][] = ['m_item as t2', 't1.item_id = t2.id', 'inner'];
		$params['join'][] = ['m_pricelist as t3', 't1.pricelist_id = t3.id', 'inner'];
		$params['join'][] = ['m_pricelist_version as t4', 't1.pricelist_version_id = t4.id', 'inner'];
		$params['where']['t1.is_deleted'] 	= '0';
		
		return $this->base_model->mget_rec($params);
	}
	
}