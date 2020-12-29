package org.ssmsuper.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssmsuper.dao.EmployeeMapper;
import org.ssmsuper.pojo.Employee;
import org.ssmsuper.pojo.EmployeeExample;
import org.ssmsuper.service.EmployeeService;

import java.util.List;

/**
 * @author lijichen
 * @date 2020/12/26 - 20:58
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> queryAllEmployee() {
        return employeeMapper.selectByExampleWithDepartment(null);
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean checkEmployeeName(String checkName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andLastNameEqualTo(checkName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    @Override
    public Employee queryEmployeeByPrimaryId(Integer id) {
        return employeeMapper.selectByPrimaryKeyWithDepartment(id);
    }

    @Override
    public void updateEmployeeByPrimaryId(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public void removeEmployeeByPrimaryId(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void removeBathEmployees(List<Integer> delete_ids) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andIdIn(delete_ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
