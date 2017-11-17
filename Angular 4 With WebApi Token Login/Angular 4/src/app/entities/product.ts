import { Category, Brand } from './index';

export class Product {
    ProductId: Number;
    BrandId: Number;
    CategoryId: Number;
    Name: String;
    PictureName: String;
    IsActive: Boolean;
    SortOrder: Number;
    Category: Category;
    Brand: Brand;
}
