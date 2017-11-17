import { Component, OnInit ,TemplateRef, ViewChild} from '@angular/core';
import { BrandService, CategoryService } from '../../../services/index';
import { Brand, Category } from '../../../entities/index';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';

import { AppError, NotFoundError,BadInput } from '../../../utilites/errorHandling/index';
import { debug } from 'util';

@Component({
  selector: 'app-brand',
  templateUrl: './brand.component.html',
  styleUrls: ['./brand.component.css']
})
export class BrandComponent implements OnInit {

 
   @ViewChild('readOnlyTemplate') readOnlyTemplate: TemplateRef<any>;
   @ViewChild('editTemplate') editTemplate: TemplateRef<any>;

    Brand: Brand;
    _AddBrand: Brand;
    _Category: Category;
  
    BrandList: Brand[];
    Categories: Category[];
    IsNewRecord: boolean;

    constructor(private _BrandService: BrandService,private _CategoryService: CategoryService) {
      this.BrandList = [];
      this.Categories = [];
      this.Brand = new Brand();
      this._AddBrand = new Brand();
      this._Category = new Category();
    }
  
    ngOnInit() {
      this.Get();
      this.GetCategories();
    }
  
    Get() {
      this._BrandService.Get()
        .subscribe((returnData) => this.BrandList = returnData);
    }

    GetCategories() {
      this._CategoryService.Get()
        .subscribe((returnData) => this.Categories = returnData);
    }

    loadTemplate(_brand: Brand) {
      if (this.Brand && this.Brand.BrandId === _brand.BrandId) {
          return this.editTemplate;
      } else {
          return this.readOnlyTemplate;
      }
    }
  
    Edit(_brand: Brand) {
      this.Brand=_brand;
    }

    Cancel() {
      this.Brand = null;
    }
  
    
    Add() {

    debugger;
      this._AddBrand.Category=new Category();
      this._AddBrand.Category.CategoryId=this._Category.CategoryId;
      this._AddBrand.Category.Name=this._Category.Name;
      this._AddBrand.CategoryId=this._Category.CategoryId;

      this.BrandList.splice(0, 0, this._AddBrand);
  
      this._BrandService.Add(this._AddBrand)
        .subscribe(returnData => {
          this._AddBrand['BrandId'] = returnData.BrandId;

          this._AddBrand = new Brand();
          this._AddBrand.Category=new Category();
        },
        (error: AppError ) => {
          this.BrandList.splice(0, 1);
          if (error instanceof BadInput) {
            alert('BadInput');
          }
          else throw error;
        });
    }
  
    Update(_cat: Brand) {
      this.Brand.Name = 'Update';
  
      _cat.Name = 'Update';
      this._BrandService.Update(_cat)
        .subscribe(null
  
        , (error: AppError) => {
  
          if (error instanceof NotFoundError) {
            alert('Not Found');
          }
          else throw error;
  
        });
    }
  
    Delete(_cat: Brand) {
      let index = this.BrandList.indexOf(_cat);
      this.BrandList.splice(index, 1);
  
      this._BrandService.Delete(_cat.BrandId).subscribe(null,
        (error: AppError) => {
  
          if (error instanceof NotFoundError) {
            alert('Already Deleted');
            this.BrandList.splice(index, 0, _cat);
          }
          else throw error;
  
        });
    }
}
