import {GoogleReCaptcha, GoogleReCaptchaProvider} from 'react-google-recaptcha-v3';
import { useEffect, useState } from 'react';
import {useForm} from 'react-hook-form';
import {toast} from 'react-toastify';

import Input from '../../../../components/controls/input/input.component';

import { httpSubmitCareer } from '../../../../hooks/career/career.requests';
import {SETTINGS} from '../../../../utils/config.utils';

const defaultFormFields = {
    title: '',
    first_name: '',
    last_name: '',
    email: '',
    contact: '',
    cover_letter: ''
};

const CareerForm = ({selectedVacancy}) => {

    const {register, handleSubmit, formState: {errors}, reset} = useForm(defaultFormFields);
    
    const [jobTitle, setJobTitle] = useState('Other');
    const [captchaValue, setCaptchaValue] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    useEffect(() => {
        selectedVacancy && selectedVacancy.length && setJobTitle(selectedVacancy);
    }, [selectedVacancy]);

    const onSubmit = async (data) => {
        const submitData = {...data, captcha: captchaValue, job_title: jobTitle};
        try {
            setIsLoading(true);
            const results = await httpSubmitCareer(submitData);
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
        <section className="career-form py-5">
            <div className="container">
                <div className="row">
                    <div className="col-12">
                        <h3>INTERESTED IN A CAREER AT {SETTINGS.siteName.toString().toUpperCase()}?</h3>
                    </div>
                    <div className="col-12">
                        <form onSubmit={handleSubmit(onSubmit)} className="form row m-1 m-lg-0 p-3 p-lg-5">
                            
                            <div className="col-lg-4">
                                <div className="form-group">
                                    <Input 
                                        type="text" 
                                        className="form-control" 
                                        label="Title" 
                                        name="title" 
                                        register={register} 
                                        validations={{required: "required"}} />
                                    {errors.title && <span className="error">{errors.title.message}</span>}
                                </div>
                            </div>

                            <div className="col-lg-4">
                                <div className="form-group">

                                    <Input 
                                        type="text" 
                                        className="form-control" 
                                        label="First Name" 
                                        name="first_name" 
                                        register={register} 
                                        validations={{required: "required"}} />

                                    {errors.firstName && <span className="error">{errors.firstName.message}</span>}

                                </div>
                            </div>

                            <div className="col-lg-4">
                                <div className="form-group">

                                    <Input 
                                        type="text" 
                                        className="form-control" 
                                        label="Last Name"
                                        name="last_name" 
                                        register={register} 
                                        validations={{required: "required"}} />

                                    {errors.lastName && <span className='error'>{errors.lastName.message}</span>}

                                </div>
                            </div>

                            <div className="col-lg-12">
                                <div className="form-group">

                                    <Input 
                                        type="text" 
                                        className="form-control" 
                                        label="Email" 
                                        name="email" 
                                        register={register} 
                                        validations={
                                            {
                                                required: "required", 
                                                pattern: {
                                                    value: /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(.\w{2,3})+$/, 
                                                    message: 'email is incorrect'
                                                }
                                            }
                                        } />

                                    {errors.email && <span className="error">{errors.email.message}</span>}

                                </div>
                            </div>

                            <div className="col-lg-12">
                                <div className="form-group">

                                    <Input 
                                        type="text" 
                                        className="form-control" 
                                        label="Contact No."
                                        name="contact" 
                                        register={register} 
                                        validations={{required: "required"}} />

                                    {errors.contact && <span className='error'>{errors.contact.message}</span>}

                                </div>
                            </div>

                            <div className="col-lg-12">
                                <div className="form-group">

                                    <Input 
                                        type="text" 
                                        className="form-control" 
                                        label="Job Title" 
                                        value={jobTitle} 
                                        readOnly={true} 
                                        name="job_title" 
                                        register={register} 
                                        validations={{required: "required"}} />

                                </div>
                            </div>

                            <div className="col-lg-12">
                                <div className="form-group">

                                    <Input 
                                        className="form-control" 
                                        cols="30" 
                                        rows="10" 
                                        label="Cover Letter" 
                                        multiline={true} 
                                        name="cover_letter"
                                        register={register}
                                        validations={{required: "required"}} />

                                    {errors.coverLetter && <span className='error'>{errors.coverLetter.message}</span>}

                                </div>
                            </div>

                            <div className="col-12">
                                <button className='btn btn2 float-end'>
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
                </div>
            </div>
        </section>
    )
}

export default CareerForm;