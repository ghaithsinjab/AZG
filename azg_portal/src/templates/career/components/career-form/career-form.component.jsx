import {SETTINGS} from '../../../../utils/config.utils';
import { useEffect, useState } from 'react';
import Input from '../../../../components/controls/input/input.component';
import {useForm} from 'react-hook-form';

const defaultFormFields = {
    title: '',
    firstName: '',
    lastName: '',
    email: '',
    contact: '',
    coverLetter: ''
};

const CareerForm = ({selectedVacancy}) => {
    const [jobTitle, setJobTitle] = useState('Other');
    const {register, handleSubmit, formState: {errors}, watch} = useForm(defaultFormFields);
    const {title, firstName, lastName, email, contact, coverLetter} = defaultFormFields;

    useEffect(() => {
        selectedVacancy && selectedVacancy.length && setJobTitle(selectedVacancy);
    }, [selectedVacancy]);

    const onSubmit = data => {
        console.log(data);
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
                                        value={title} 
                                        name="title" 
                                        register={register} 
                                        validations={{required: "required"}} />
                                    {errors.title && <span>{errors.title.message}</span>}
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="form-group">
                                    <Input type="text" className="form-control" label="First Name" value={firstName} name="firstName" register={register} validations={{required: "required"}} />
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="form-group">
                                    <Input type="text" className="form-control" label="Last Name" value={lastName} name="lastName" register={register} validations={{required: "required"}} />
                                </div>
                            </div>
                            <div className="col-lg-12">
                                <div className="form-group">
                                    <Input type="text" className="form-control" label="Email" value={email} name="email" register={register} validations={{required: "required", pattern: {value: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, message: 'email is incorrect'}}} />
                                    {errors.email && <span>{errors.email.message}</span>}
                                </div>
                            </div>
                            <div className="col-lg-12">
                                <div className="form-group">
                                    <Input type="text" className="form-control" label="Contact No." value={contact} name="contact" register={register} validations={{required: "required"}} />
                                </div>
                            </div>
                            <div className="col-lg-12">
                                <div className="form-group">
                                    <Input type="text" className="form-control" label="Job Title" value={jobTitle} readOnly={true} name="jobTitle" register={register} validations={{required: "required"}} />
                                </div>
                            </div>
                            <div className="col-lg-12">
                                <div className="form-group">
                                    <Input className="form-control" cols="30" rows="10" label="Cover Letter" multiline={true} value={coverLetter} name="coverLetter" register={register} validations={{required: "required"}} />
                                </div>
                            </div>
                            <div className="col-12">
                                <button className='btn btn2 float-end'>Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default CareerForm;