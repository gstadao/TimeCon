<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model
{
    /**
     * This function is used to get the user listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function userListingCount($searchText = '')
    {
        $this->db->select('US.us_id_usuario, US.email, US.nombre, US.telefono, ROL.role');
        $this->db->from('us_usuario as US');
        $this->db->join('us_rol as ROL', 'ROL.us_id_rol = US.us_id_rol','left');
        if(!empty($searchText)) { $this->db->or_like('US.email', $searchText); $this->db->or_like('US.nombre', $searchText); $this->db->or_like('US.telefono', $searchText); }
        $this->db->where('US.activo', 0);
        $this->db->where('US.us_id_rol !=', 1);
        $query = $this->db->get();

        return count($query->result());
    }

    /**
     * This function is used to get the user listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function userListing($searchText = '', $page, $segment)
    {
        $this->db->select('US.us_id_usuario, US.email, US.nombre, US.telefono, ROL.role');
        $this->db->from('us_usuario as US');
        $this->db->join('us_rol as ROL', 'ROL.us_id_rol = US.us_id_rol','left');
        if(!empty($searchText)) { $this->db->or_like('US.email', $searchText); $this->db->or_like('US.nombre', $searchText); $this->db->or_like('US.telefono', $searchText); }
        $this->db->where('US.activo', 0);
        $this->db->where('US.us_id_rol !=', 1);
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        return $query->result();
    }

    /**
     * This function is used to get the user roles information
     * @return array $result : This is result of the query
     */
    function getUserRoles()
    {
        $this->db->select('us_id_rol, role');
        $this->db->from('us_rol');
        $this->db->where('us_id_rol !=', 1);
        $query = $this->db->get();

        return $query->result();
    }


    /**
     * This function is used to add new user to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewUser($userInfo)
    {
        $this->db->trans_start();
        $this->db->insert('us_usuario', $userInfo);

        $insert_id = $this->db->insert_id();

        $this->db->trans_complete();

        return $insert_id;
    }

    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfo($userId)
    {
        $this->db->select('us_id_usuario, nombre, email, telefono, us_id_rol');
        $this->db->from('us_usuario');
        $this->db->where('activo', 0);
		$this->db->where('us_id_rol !=', 1);
        $this->db->where('us_id_usuario', $userId);
        $query = $this->db->get();

        return $query->result();
    }


    /**
     * This function is used to update the user information
     * @param array $userInfo : This is users updated information
     * @param number $userId : This is user id
     */
    function editUser($userInfo, $userId)
    {
        $this->db->where('us_id_usuario', $userId);
        $this->db->update('us_usuario', $userInfo);

        return TRUE;
    }



    /**
     * This function is used to delete the user information
     * @param number $userId : This is user id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteUser($userId, $userInfo)
    {
        $this->db->where('us_id_usuario', $userId);
        $this->db->update('us_usuario', $userInfo);

        return $this->db->affected_rows();
    }


    /**
     * This function is used to match users password for change password
     * @param number $userId : This is user id
     */
    function matchOldPassword($userId, $oldPassword)
    {
        $this->db->select('us_id_usuario');
        $this->db->where('us_id_usuario', $userId);
        $this->db->where('password', $oldPassword);
        $this->db->where('activo', 0);
        $query = $this->db->get('us_usuario');

        return $query->result();
    }

    /**
     * This function is used to change users password
     * @param number $userId : This is user id
     * @param array $userInfo : This is user updation info
     */
    function changePassword($userId, $userInfo)
    {
        $this->db->where('us_id_usuario', $userId);
        $this->db->where('activo', 0);
        $this->db->update('us_usuario', $userInfo);
        
        return $this->db->affected_rows();
    }
}

  