import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssmsuper.dao.EmployeeMapper;
import org.ssmsuper.pojo.Department;
import org.ssmsuper.pojo.Employee;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ContextConfiguration : 使用spring的单元测试, 可以自动注入
 * @author lijichen
 * @date 2020/12/26 - 19:20
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Resource(name = "sqlSessionBatch")
    private SqlSession sqlSession;

    @Test
    public void testWithDemp() {
        List<Employee> employees = employeeMapper.selectByExampleWithDepartment(null);
        System.out.println(employees.get(0).getDepartment());
        Employee employee = employeeMapper.selectByPrimaryKeyWithDepartment(3);
        System.out.println(employee.getDepartment());
    }

    @Test
    public void testBath() {
        // 得到一个可以批量添加的Mapper : EmployeeMapper
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        employeeMapper.insertSelective(new Employee()); // 报错, 空对象会报错
        mapper.insertSelective(new Employee(null,"sdf","eee",1));
//        for (int i = 0; i <= 100; i++) {
//            mapper.insertSelective();//略...
//        }
    }
}
