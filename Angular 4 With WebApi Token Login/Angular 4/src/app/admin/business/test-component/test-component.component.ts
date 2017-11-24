import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material';
import {FormControl} from '@angular/forms';

export class User {
  constructor(public name: string) { }
}

@Component({
  selector: 'app-test-component',
  templateUrl: './test-component.component.html',
  styleUrls: ['./test-component.component.css']
})
export class TestComponentComponent implements OnInit {

  toppings = new FormControl();

  toppingList = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato'];

  favoriteSeason: string;
  
    seasons = [
      'Winter',
      'Spring',
      'Summer',
      'Autumn',
    ];
    
  constructor(public snackBar: MatSnackBar) { }

  ngOnInit() {
  }

  openSnackBar(message: string, action: string) {
    this.snackBar.open(message, action, {
      duration: 2000,
    });
  }

}
