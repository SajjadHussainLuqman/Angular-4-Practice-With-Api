import { Category, Brand } from './index';

export class Product {
    ProductId: Number;
    BrandId: Number;
    BrandName: String;
    CategoryId: Number;
    CategoryName: String;
    Name: String;
    PictureName: String;
    IsActive: Boolean;
    SortOrder: Number;
}
