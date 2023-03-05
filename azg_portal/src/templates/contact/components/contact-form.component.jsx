import {GoogleReCaptcha, GoogleReCaptchaProvider} from 'react-google-recaptcha-v3';
import {useForm} from 'react-hook-form';
import {toast} from 'react-toastify';
import { useState } from 'react';

import Input from "../../../components/controls/input/input.component";

import {httpSubmitContact} from '../../../hooks/contact/contact.requests';
import { SETTINGS } from '../../../utils/config.utils';

const defaultFormFields = {
    name: '',
    email: '',
    contact: '',
    message: '',
}

const ContactForm = () => {

    const {register, handleSubmit, formState: {errors}, reset} = useForm(defaultFormFields);

    const [captchaValue, setCaptchaValue] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    const onSubmit = async (data) => {
        const submitData = {...data, captcha: captchaValue};
        try {
            setIsLoading(true);
            const results = await httpSubmitContact(submitData);
            setIsLoading(false);
            results && results.id && results.id > 0 && toast.success('Your request has been successfuly submitted!');
            reset(defaultFormFields);
        } catch(ex) {
            SETTINGS.enableDebug && console.log(ex);
            toast.error(ex.message);
            setIsLoading(false);
        }
    }

    const onCaptchaChange = value => {
        setCaptchaValue(value);
    }

    return (
        <div className="scale-item about-item contact-form">

            <h3 className="text-center">Enquiry Form</h3>

            <form onSubmit={handleSubmit(onSubmit)} className="contact-form p-3 p-lg-5">
                <div className="form row">

                    <div className="col-12">
                        <div className="form-group">
                            <Input 
                                type="text"
                                name="name"
                                className="form-control"
                                label="Name"
                                register={register}
                                validations={{required: 'required'}}
                            />
                            {errors.name && <span className='error'>{errors.name.message}</span>}
                        </div>
                    </div>

                    <div className="col-12">
                        <div className="form-group">
                            <Input 
                                type="email"
                                className="form-control"
                                name="email"
                                label="Email Address"
                                register={register}
                                validations={
                                    {
                                        required: "required", 
                                        pattern: {
                                            value: /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(.\w{2,3})+$/, 
                                            message: 'email is incorrect'
                                        }
                                    }
                                }
                            />
                            {errors.email && <span className="error">{errors.email.message}</span>}
                        </div>
                    </div>

                    <div className="col-12">
                        <div className="form-group">
                            <Input 
                                type="text"
                                className="form-control"
                                name="contact"
                                label="Contact Number"
                                register={register}
                                validation={{required: 'required'}}
                            />
                            {errors.contact && <span className='error'>{errors.contact.message}</span>}
                        </div>
                    </div>

                    <div className="col-12">
                        <div className="form-group">
                            <Input 
                                multiline={true}
                                className="form-control"
                                name="message"
                                label="Requests"
                                register={register}
                                validations={{required: 'required'}}
                            />
                            {errors.message && <span className='error'>{errors.message.message}</span>}
                        </div>
                    </div>

                </div>

                <div className="justify-content-center d-flex">
                    <button className='btn btn2'>
                        {
                            isLoading ? <span className="fa fa-spin fa-spinner"></span> : 'Submit'
                        }
                    </button>
                </div>

                <GoogleReCaptchaProvider reCaptchaKey={SETTINGS.captcha}>
                    <GoogleReCaptcha onVerify={token => onCaptchaChange(token)} />
                </GoogleReCaptchaProvider>

            </form>
        </div>
    )
}

export default ContactForm;