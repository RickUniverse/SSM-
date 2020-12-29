package org.ssmsuper.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.ssmsuper.pojo.Department;
import org.ssmsuper.pojo.Employee;
import org.ssmsuper.pojo.EmployeeExample;
import org.ssmsuper.pojo.Msg;
import org.ssmsuper.service.DepartmentService;
import org.ssmsuper.service.EmployeeService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lijichen
 * @date 2020/12/26 - 20:46
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentService departmentService;




    @ResponseBody
    @RequestMapping(value = "/checkEmployeeName")
    public Msg checkEmployeeName(@RequestParam("checkName") String checkName) {

        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if (!checkName.matches(regx)) {
            return Msg.fail()
                    .setMsg("名字必须是2-5个汉字或6-16个的英文字符可以包含 - _ 符号!");
        }

        boolean flag = employeeService.checkEmployeeName(checkName);
        if (flag) {
            return Msg.success()
                    .setMsg("用户名可用的!");
        }
        return Msg.fail()
                .setMsg("用户名已存在!");
    }


    //删除一个或多个员工
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public Msg removeEmployee(@PathVariable("ids") String ids) {
        if (ids.contains("-")) {
            String[] str_ids = ids.split("-");
            List<Integer> delete_ids = new ArrayList<>();
            for (String str_id : str_ids) {
                delete_ids.add(Integer.parseInt(str_id));
            }
            employeeService.removeBathEmployees(delete_ids);
        } else {
            employeeService.removeEmployeeByPrimaryId(Integer.parseInt(ids));
        }
        return Msg.success().setMsg("删除成功!");
    }

    /**
     * /emp/{id} -> 这个id 如果想要装配到对象中, 则需要跟对象中的id一致
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    public Msg getEmployee(Employee employee) {
        employeeService.updateEmployeeByPrimaryId(employee);
        return Msg.success();
    }

    // 获取一个员工
    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public Msg getEmployee(@PathVariable("id") Integer id) {
        Employee employee = employeeService.queryEmployeeByPrimaryId(id);
        return Msg.success().
                addData("employee", employee);
    }

    //添加一个员工
    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public Msg addEmployee(@Valid Employee employee, BindingResult result) {

        if (result.hasErrors()){
            Map<String, Object> errorMap = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("校验失败的字段为:" + fieldError.getField());
                System.out.println("消息为:" + fieldError.getDefaultMessage());
                errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().addData("errorFields", errorMap);
        }

        employeeService.addEmployee(employee);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping("/departments")
    public Msg AjaxDepartments() {
        List<Department> departments = departmentService.queryAllDepartments();
        return Msg.success()
                .addData("departments",departments);
    }


    @ResponseBody
    @RequestMapping("/AjaxPageEmployee")
    public Msg AjaxPageEmployee(@RequestParam(required = false,defaultValue = "1") Integer pageNo) {

        PageHelper.startPage(pageNo,5);
        List<Employee> employees = employeeService.queryAllEmployee();

        PageInfo<Employee> pageInfo = new PageInfo<>(employees, 5);

        return Msg.success()
                .addData("pageInfo",pageInfo);
    }


    @RequestMapping("/employees")
    public Object employees(@RequestParam(required = false,defaultValue = "1") Integer pageNo) {


        PageHelper.startPage(pageNo,5);
        List<Employee> employees = employeeService.queryAllEmployee();

        PageInfo<Employee> pageInfo = new PageInfo<>(employees, 5);

        return new ModelAndView("user/employeeAjax")
                .addObject("pageInfo",pageInfo);
    }
}
