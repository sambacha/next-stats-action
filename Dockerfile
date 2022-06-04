FROM node:14-buster-slim

LABEL com.github.actions.name="Next.js PR Stats"
LABEL com.github.actions.description="Compares stats of a PR with the main branch"
LABEL repository="https://github.com/vercel/next-stats-action"

COPY . /next-stats

# Install node_modules
RUN cd /next-stats && npm install --production

RUN git config --global user.email 'stats@localhost'
RUN git config --global user.name 'next stats'

RUN apt update && apt install apache2-utils -y
ENV NEXT_TELEMETRY_DISABLED 1

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
