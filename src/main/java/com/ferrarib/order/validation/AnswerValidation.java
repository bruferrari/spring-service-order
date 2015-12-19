package com.ferrarib.order.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ferrarib.order.model.Answer;

public class AnswerValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Answer.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "answer", "field.required");
	}

}
