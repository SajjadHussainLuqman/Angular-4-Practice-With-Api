import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../../../services/category.service';
import { Category } from '../../../entities/category';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';

import { AppError, NotFoundError,BadInput } from '../../../utilites/errorHandling/index';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})
export class CategoryComponent implements OnInit {

 
    category: Category;
  
    categoryList: Category[];
  
    constructor(private _categoryService: CategoryService) {
      this.categoryList = [];
      this.category = new Category();
    }
  
    ngOnInit() {
      this.Get();
    }
  
    Get() {
      this._categoryService.Get()
        .subscribe((returnData) => this.categoryList = returnData);
    }
  
    Edit(_catId: Number) {
      this._categoryService.GetById(_catId)
        .subscribe((returnData) => this.category = returnData,
        (error: AppError) => {
          if (error instanceof NotFoundError) {
            alert('Not Found');
          }
          else throw error;
  
        });
    }
  
    Add() {
      this.categoryList.splice(0, 0, this.category);
  
      this._categoryService.Add(this.category)
        .subscribe(returnData => {
          this.category['CategoryId'] = returnData.CategoryId;
          this.category = new Category();
  
        },
        (error: AppError ) => {
          this.categoryList.splice(0, 1);
          if (error instanceof BadInput) {
            alert('BadInput');
          }
          else throw error;
        });
    }
  
    Update(_cat: Category) {
      this.category.Name = 'Update';
  
      _cat.Name = 'Update';
      this._categoryService.Update(_cat)
        .subscribe(null
  
        , (error: AppError) => {
  
          if (error instanceof NotFoundError) {
            alert('Not Found');
          }
          else throw error;
  
        });
    }
  
    Delete(_cat: Category) {
      let index = this.categoryList.indexOf(_cat);
      this.categoryList.splice(index, 1);
  
      this._categoryService.Delete(_cat.CategoryId).subscribe(null,
        (error: AppError) => {
  
          if (error instanceof NotFoundError) {
            alert('Already Deleted');
            this.categoryList.splice(index, 0, _cat);
          }
          else throw error;
  
        });
    }
  
  

}
