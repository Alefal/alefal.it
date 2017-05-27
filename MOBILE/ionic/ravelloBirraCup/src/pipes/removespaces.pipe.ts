import { Pipe, PipeTransform } from '@angular/core';
 
@Pipe({name: 'removeSpaces'})

export class RemoveSpaces implements PipeTransform {
    transform(value: string){
		//return value.replace(/ /g, '');               //space
		return value.replace(/(\r\n|\n|\r)/gm, '');     //\n \r
        
	}
}