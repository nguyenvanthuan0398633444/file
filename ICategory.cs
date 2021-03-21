using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using ShopWebApplication.Models;

namespace ShopWebApplication.Services.Interfaces
{
    interface ICategory
    {
        IPagedList<Category> GetListCategory(int? page, string search);
        Category NewCategory(Category category);
        Category EditCategory(Category model);
        Boolean DeleteCategory(int id);
    }
}
