import { Component, OnInit, ViewChild, AfterViewInit } from '@angular/core';
import {MatPaginator, MatTableDataSource, MatSort } from '@angular/material';
import { BrandService, CategoryService } from '../../../services/index';
import { Brand, Category } from '../../../entities/index';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';

import { AppError, NotFoundError,BadInput } from '../../../utilites/errorHandling/index';
import { debug } from 'util';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit, AfterViewInit {

  _brand: Brand;
  _brandList: Brand[];

  displayedColumns = ['BrandId', 'Name', 'CategoryName', 'IsActive'];
  
  dataSource;
  
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private _BrandService: BrandService,private _CategoryService: CategoryService) {
    this._brandList = [];
    this._brand = new Brand();
    this.dataSource = new MatTableDataSource<Brand>(this._brandList);
   }

  ngOnInit() {
    this.Get();
  }

  Get() {
    this._BrandService.Get()
      .subscribe((returnData) => {
        this._brandList = returnData; 
        this.dataSource = new MatTableDataSource<Brand>(this._brandList);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      });
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

}