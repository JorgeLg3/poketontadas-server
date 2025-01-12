FROM python:3.8-slim

#RUN apt-get update && apt-get install -y python3-distutils

COPY /PBS /PBS
COPY ./cable_club_v20_21.py .
COPY ./OnlinePresets ./OnlinePresets

WORKDIR /PBS
RUN python3 cable_club_pokemon_processor.py pokemon.txt --mode propagate -pf pokemon_forms.txt

EXPOSE 9999

WORKDIR ..
CMD ["python3", "cable_club_v20_21.py", "--log=DEBUG", "--host=0.0.0.0"]