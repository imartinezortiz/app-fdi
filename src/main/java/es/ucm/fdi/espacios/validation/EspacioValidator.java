/**
 * This file is part of Portal Web de la FDI.
 *
 * Portal Web de la FDI is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Portal Web de la FDI is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Portal Web de la FDI.  If not, see <http://www.gnu.org/licenses/>.
 */
package es.ucm.fdi.espacios.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import es.ucm.fdi.espacios.business.entity.Espacio;

@Component
public class EspacioValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Espacio.class.equals(arg0);
	}

	@Override
	public void validate(Object o, Errors errs) {		
		Espacio espacio = (Espacio) o;
		if (espacio.getNombre().length() <= 4 || espacio.getNombre().length() >= 50){
			errs.rejectValue("nombre", "Size.Espacio.nombre.validation");
		}

	}

}
