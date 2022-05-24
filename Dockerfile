FROM dfam/tetools:1.5
RUN apt update && apt install -y build-essential git
WORKDIR /opt/RepeatModeler
RUN sed -i '/my $useLtrDet/ s/0/1/' -i '/#my $LTR_DETECTOR_DIR/ s/#//' -i '/my $LTR_DETECTOR_DIR;/d' LTRPipeline
RUN sed -i '/$configuration =/ s/$/\x27LTR_DETECTOR_DIR\x27 => { \x27command_line_override\x27 => \x27ltr_detector_dir\x27, \x27description\x27 => \x27The path to the installation of the LtrDetector.\x27, \x27environment_override\x27 => \x27LTR_DETECTOR_DIR\x27, \x27expected_binaries\x27 => [ \x27LtrDetector\x27 ], \x27param_type\x27 => \x27directory\x27, \x27required\x27 => 0, \x27value\x27 => \x27\/opt\/LtrDetector\/bin\x27 },/' RepModelConfig.pm
RUN sed -i '/#if ( ! $options{/ s/#//' -i '/#  RepModelConfig::promptForParam/ s/#//' -i '/#}/ s/#//' configure
WORKDIR /opt
RUN git clone https://github.com/BioinformaticsToolsmith/LtrDetector.git
WORKDIR /opt/LtrDetector/src
RUN make bin
RUN make tr -j
WORKDIR /opt/LtrDetector/bin
RUN chmod +x LtrDetector
