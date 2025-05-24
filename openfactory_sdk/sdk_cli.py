""" OpenFactory-SDK Command Line Interface. """
import click


@click.group()
def cli():
    """ OpenFactory SDK CLI - Develop and test OpenFactory apps locally. """
    pass


@cli.command()
def init():
    """ Initialize the local OpenFactory SDK environment. """
    click.echo("Initializing OpenFactory SDK environment...")


@cli.command()
def up():
    """ Start the local OpenFactory infrastructure (Kafka, ksqlDB, etc). """
    click.echo("Starting OpenFactory virtual infrastructure...")


@cli.command()
def down():
    """ Tear down the local OpenFactory infrastructure. """
    click.echo("Stopping OpenFactory virtual infrastructure...")


@cli.command()
@click.argument("app_config", type=click.Path(exists=True))
def deploy(app_config):
    """ Deploy an OpenFactory app from a config file. """
    click.echo(f"Deploying application defined in {app_config}...")


@cli.command()
def status():
    """ Show the status of the local SDK cluster. """
    click.echo("Showing infrastructure and app status...")
