import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.ssmsuper.pojo.Employee;

/**
 * 使用如果出现找不到cookie类的错误, 需要使用servlet-api 3.0 以上的版本
 * @author lijichen
 * @date 2020/12/26 - 21:21
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration//用于自动装配上WebApplicationContext
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "file:E:\\yangyangli\\Desktop\\IDEA-workspace\\SSMSuper\\src\\main\\webapp\\WEB-INF\\dispatcher-servlet.xml"})
public class MVCTest {

    @Autowired
    private WebApplicationContext context;
    //虚拟的MVC
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        MvcResult pageNo = mockMvc.perform(MockMvcRequestBuilders.get("/employee/employees")
                .param("pageNo", "1")
        ).andReturn();

        MockHttpServletRequest request = pageNo.getRequest();
        PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
        System.out.println("当前页:" + pageInfo.getPageNum());
        System.out.println("总页:" + pageInfo.getPages());
        System.out.println("总记录数:" + pageInfo.getTotal());
        System.out.println("连续显示的页码:" + pageInfo.getNavigatepageNums());
        System.out.println("分页数据:" + pageInfo.getList());
        System.out.println("分页数据:" + pageInfo.isIsFirstPage());
        System.out.println("分页数据:" + pageInfo.isIsLastPage());
        System.out.println("分页数据:" + pageInfo.isHasNextPage());

    }
}
