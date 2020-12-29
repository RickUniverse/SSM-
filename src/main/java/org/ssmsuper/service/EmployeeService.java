package org.ssmsuper.service;

import org.ssmsuper.pojo.Employee;

import java.util.List;

/**
 * @author lijichen
 * @date 2020/12/26 - 17:10
 */
public interface EmployeeService {
    List<Employee> queryAllEmployee();

    void addEmployee(Employee employee);

    boolean checkEmployeeName(String checkName);

    Employee queryEmployeeByPrimaryId(Integer id);

    void updateEmployeeByPrimaryId(Employee employee);

    void removeEmployeeByPrimaryId(Integer id);

    void removeBathEmployees(List<Integer> delete_ids);
}
