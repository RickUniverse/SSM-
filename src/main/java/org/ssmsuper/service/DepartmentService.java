package org.ssmsuper.service;

import org.ssmsuper.pojo.Department;

import java.util.List;

/**
 * @author lijichen
 * @date 2020/12/27 - 17:56
 */
public interface DepartmentService {
    List<Department> queryAllDepartments();
}
