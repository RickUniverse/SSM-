package org.ssmsuper.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssmsuper.dao.DepartmentMapper;
import org.ssmsuper.pojo.Department;
import org.ssmsuper.service.DepartmentService;

import java.util.List;

/**
 * @author lijichen
 * @date 2020/12/27 - 17:57
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> queryAllDepartments() {
        return departmentMapper.selectByExample(null);
    }
}
